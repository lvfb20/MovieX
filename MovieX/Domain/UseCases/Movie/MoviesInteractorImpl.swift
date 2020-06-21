//
//  MoviesInteractorImpl.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
import RxSwift

class MoviesInteractorImpl: BaseInteractorImpl, MoviesInteractor {

    private var moviesRepository: MoviesRepository
    
    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
    
    func getPopularMovies() -> Single<[Movie]> {
        return moviesRepository.getPopularMovies()
    }
}
