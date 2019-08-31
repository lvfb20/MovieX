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
}

extension MockMoviesListViewController: MoviesListView {
    func showMovies(_ movies: [Movie]) {
        showMoviesCalled = true
    }
}

