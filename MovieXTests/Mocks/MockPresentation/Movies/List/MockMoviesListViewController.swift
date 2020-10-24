//
//  MockMoviesListViewController.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
@testable import MovieX

class MockMoviesListViewController: MockBaseViewController<MoviesListPresenter> {
    var showMoviesCalled = false
    var showMovieDetailCalled = false
    
}

extension MockMoviesListViewController: MoviesListView {
    func reloadMovies() {
        showMoviesCalled = true
    }
    
    func showMovieDetail(movie: Movie) {
        showMovieDetailCalled = true
    }
}

