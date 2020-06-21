//
//  MoviesInteractor.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
import RxSwift

protocol MoviesInteractorProtocol {
    func getPopularMovies() -> Single<[Movie]>
}

class MoviesInteractor: BaseInteractor, MoviesInteractorProtocol {

    private var moviesRepository: MoviesRepository
    
    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
    
    func getPopularMovies() -> Single<[Movie]> {
        return moviesRepository.getPopularMovies()
    }
}
