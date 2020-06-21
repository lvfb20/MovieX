//
//  MovieDetailPresenter.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

class MovieDetailPresenter: BasePresenter {
    
    internal var view: MovieDetailView? {
        return baseView as? MovieDetailView
    }
    
    private let movie: Movie
    
    init(wireframe: Wireframe, movie: Movie) {
        self.movie = movie
        super.init(wireframe: wireframe)
    }
    
    override func viewDidLoad() {
        view?.showDetails(movie: movie)
    }
}
