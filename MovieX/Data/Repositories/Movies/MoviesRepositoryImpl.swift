//
//  MoviesRepositoryImpl.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
import RxSwift

class MoviesRepositoryImpl: BaseRepositoryImpl, MoviesRepository {
    
    func getPopularMovies() -> Single<[Movie]> {
        var request = BaseRequest()
        request = fillBaseRequest(request)
        
        return networkManager.makeRequest(MoviesTarget.popularMovies(request: request))
            .catchMovieXError(ErrorResponse.self)            
            .map(BaseListResponseWithBody<MovieEntity>.self)
            .flatMap({ (response) -> Single<[Movie]> in
                do {
                    if let entities = response.results {
                        let movies = try entities.map { try MoviesFactory.newMovie(with: $0)}
                        return Single.just(movies)
                    }
                } catch {
                    return Single.error(error)
                }
                return Single.error(MovieXError.general)
            })
    }
}
