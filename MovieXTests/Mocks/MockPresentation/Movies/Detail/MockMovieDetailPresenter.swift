//
//  MockMovieDetailPresenter.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
@testable import MovieX

class MockMovieDetailPresenter: MovieDetailPresenter {
    
    var viewDidLoadCalled: Bool = false
    var movieToShow: Movie?
    
    override func viewDidLoad() {
        viewDidLoadCalled = true
        print("view did load called")
        if let movie = self.movieToShow {
            print("view show detail called")
            self.view?.showDetails(movie: movie)
        }
    }
}
