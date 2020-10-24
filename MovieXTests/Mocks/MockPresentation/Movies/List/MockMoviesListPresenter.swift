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
    var didSelectRowCalled: Bool = false
    var movies:[Movie] = []
    
    override func viewDidLoad() {
        viewDidLoadCalled = true
        buildViewModels()
    }
    
    override func buildViewModels() {
        viewModels = movies.map({MovieCellViewModel(title: $0.title, posterImage: $0.getThumbnail())})
        view?.reloadMovies()
    }
    
    override func didSelectRow(at index: Int) {
        didSelectRowCalled = true
    }
    
}
