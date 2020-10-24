//
//  MockMoviesInteractor.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
import RxSwift
@testable import MovieX

class MockMoviesInteractor: MockBaseIteractor, MoviesInteractor {
   
    var getPopularMoviesCalled = false
    
    init(moviesRepository: MoviesRepository) {
        super.init()
    }
    
    var getPopularMoviesData: [Movie]?
    func getPopularMovies() -> Single<[Movie]> {
        getPopularMoviesCalled = true
        return TestingUtils.returnGeneralErrorIfDataIsNil(data: getPopularMoviesData)
    }
    
}
