//
//  MockMovieDetailViewController.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
@testable import MovieX

class MockMovieDetailViewController: MockBaseViewController<MovieDetailPresenter> {
    var showDetailsCalled = false
}

extension MockMovieDetailViewController: MovieDetailView {
    func showDetails(movie: Movie) {
        showDetailsCalled = true
    }
}
