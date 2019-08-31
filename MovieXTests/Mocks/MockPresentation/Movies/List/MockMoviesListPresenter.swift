//
//  MockMoviesListPresenter.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
@testable import MovieX

class MockMoviesListPresenter: MoviesListPresenter {
    
    var viewDidLoadCalled: Bool = false
    var moviesToShow: [Movie]?
    
    override func viewDidLoad() {
        viewDidLoadCalled = true
        if let movies = self.moviesToShow {
            self.view?.showMovies(movies)
        } 
    }
}
