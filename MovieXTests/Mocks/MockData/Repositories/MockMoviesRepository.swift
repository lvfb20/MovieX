//
//  MockMoviesRepository.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
import RxSwift
import Moya
@testable import MovieX

class MockMoviesRepository: BaseRepositoryImpl, MoviesRepository {
   
    var getPopularMoviesData: [Movie]?
    func getPopularMovies() -> Single<[Movie]> {
         return TestingUtils.returnGeneralErrorIfDataIsNil(data: getPopularMoviesData)
    }
}
