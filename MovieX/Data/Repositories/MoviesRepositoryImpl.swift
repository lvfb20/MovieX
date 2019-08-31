//
//  MoviesRepositoryImpl.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import RxSwift

class MoviesRepositoryImpl: BaseRepositoryImpl, MoviesRepository {
   
    func getPopularMovies() -> Single<[Movie]> {
        var request = BaseRequest()
        request = fillBaseRequest(request)
        
        return networkManager.makeRequest(MoviesTarget.popularMovies(request: request))
        .filterSuccessfulStatusCodes()
        .mapObject(BaseListResponseWithBody<MovieEntity>.self)
            .flatMap({ (response) -> Single<[Movie]> in
                if let results = response.results {
                    var movies: [Movie] = []
                    movies = results.map({$0.parseToModel()})
                    return Single.just(movies)
                } else {
                    return Single.error(RepositoryError.parsing)
                }
            })
    }
}
