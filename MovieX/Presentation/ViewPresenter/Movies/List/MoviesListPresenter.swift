//
//  MoviesListPresenter.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

class MoviesListPresenter: BasePresenter {
    
    internal var view: MoviesListView? {
        return baseView as? MoviesListView
    }
    
    private var moviesInteractor: MoviesInteractorProtocol

    init(moviesInteractor: MoviesInteractorProtocol) {
        self.moviesInteractor = moviesInteractor
    }
    
    override func viewDidLoad() {
        view?.showLoading()
        moviesInteractor.getPopularMovies()
            .subscribe(onSuccess: { (movies) in
                self.view?.hideLoading()
                self.view?.showMovies(movies)
            }, onError: {(error) in
                self.view?.hideLoading()
                self.handleError(error)
            }).disposed(by: disposeBag)
    }
}
