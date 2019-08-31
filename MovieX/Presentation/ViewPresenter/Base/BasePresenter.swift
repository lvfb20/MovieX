//
//  BasePresenter.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper

class BasePresenter {
    internal weak var baseView: BaseView?
    internal var disposeBag: DisposeBag = DisposeBag()
    
    init() {}
    func viewDidLoad() { }
    func attachView<T: BaseView>(view: T) {
        self.baseView = view
    }
}

extension BasePresenter {
    
    func handleGenericError() {
        self.baseView?.showNativeAlert(title: "error".locale(), message: "error".locale())
    }
    
    func handleStringError(error: String) {
        self.baseView?.showPrettyAlert(title: "error".locale(), message: error)
    }
    
    func handleApiError(baseResponse: BaseResponse?) {
        if let dataMessage = baseResponse?.message {
            self.baseView?.showPrettyAlert(title: "error".locale(), message: dataMessage)
        } else {
            self.baseView?.showNativeAlert(title: "error".locale(), message: "error_try_again".locale())
        }
    }
    
    func handleError(_ error: Error) {
        switch error {
        case let moyaError as MoyaError:
            self.handleMoyaError(moyaError)
        default:
            self.handleGenericError()
            return
        }
    }
    
    private func handleMoyaError(_ moyaError: MoyaError) {
        if let response = moyaError.response {
            do {
                let baseResponse = try response.mapObject(BaseResponse.self)
                self.handleApiError(baseResponse: baseResponse)
            } catch {
                self.handleGenericError()
            }
        } else {
            self.handleGenericError()
        }
    }
    
    func tryToGetErrorResponse(error: Error) -> BaseResponse? {
        if let moyaError = error as? MoyaError, let response = moyaError.response {
            do {
                return try response.mapObject(BaseResponse.self)
            } catch {
            }
        }
        return nil
    }
}
