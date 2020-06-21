//
//  MoviesInteractor.swift
//  MovieX
//
//  Created by Legna Filloy on 6/21/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//

import Foundation
import RxSwift

protocol MoviesInteractor {
    func getPopularMovies() -> Single<[Movie]>
}
