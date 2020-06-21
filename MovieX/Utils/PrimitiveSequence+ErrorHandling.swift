//
//  PrimitiveSequence+ErrorHandling.swift
//  MovieX
//
//  Created by Legna Filloy on 6/20/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//

import RxSwift
import Moya

// MARK: - Single extension
extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    func catchMovieXError(_ type: ErrorResponse.Type) -> Single<Element> {
        return flatMap { response in
            switch response.statusCode {
            case 200...299: return .just(response)
            case 401: return .error(MovieXError.unauthorized(message: "Access Denied."))
            default:
                do {
                    // Try to map EelpErrorResponse
                    let errorResponse = try response.map(type.self)
                    guard let errorMessage = errorResponse.message else {
                        throw MovieXError.parsing(message: "Failed retrieving API error.")
                    }
                    throw MovieXError.api(message: errorMessage)
                } catch {
                    throw error
                }
            }
        }
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    func handleError(presenter: BasePresenter) -> Single<Element> {
        return self.observeOn(MainScheduler.instance).do(onError: { error in
            switch error {
            case let moyaError as MoyaError:
                presenter.handle(movieXError: handleMoyaError(moyaError))
            case let movieXError as MovieXError:
                presenter.handle(movieXError: movieXError)
            default:
                presenter.handle(movieXError: .unknown(message: "Error couldn't be handled."))
            }
        })
    }
}

// MARK: - Completable extension
extension PrimitiveSequence where Trait == CompletableTrait, Element == Never {
    func handleError(presenter: BasePresenter) -> Completable {
        return self.observeOn(MainScheduler.instance).do(onError: { error in
            switch error {
            case let moyaError as MoyaError:
                presenter.handle(movieXError: handleMoyaError(moyaError))
            case let movieXError as MovieXError:
                presenter.handle(movieXError: movieXError)
            default:
                presenter.handle(movieXError: .unknown(message: "Error couldn't be handled."))
            }
        })
    }
}

extension ObservableType {
    func handleError(presenter: BasePresenter) -> Observable<Element> {
        return self.observeOn(MainScheduler.instance).do(onError: { error in
            switch error {
            case let moyaError as MoyaError:
                presenter.handle(movieXError: handleMoyaError(moyaError))
            case let movieXError as MovieXError:
                presenter.handle(movieXError: movieXError)
            default:
                presenter.handle(movieXError: .unknown(message: "Error couldn't be handled."))
            }
        })
    }
}

private func handleMoyaError(_ moyaError: MoyaError) -> MovieXError {
    switch moyaError {
    case let .statusCode(response):
        switch response.statusCode {
        case 500..<600:
            return MovieXError.serverException(message: moyaError.errorDescription)
        default:
            return MovieXError.unknown(message: moyaError.errorDescription)
        }
    default:
        return MovieXError.unknown(message: moyaError.errorDescription)
    }
}

