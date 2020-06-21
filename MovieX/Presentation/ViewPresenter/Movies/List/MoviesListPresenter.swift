//
//  MoviesListPresenter.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
import RxSwift

class MoviesListPresenter: BasePresenter {
    
    internal var view: MoviesListView? {
        return baseView as? MoviesListView
    }
    
    private var moviesInteractor: MoviesInteractorProtocol

    init(wireframe: Wireframe,
         moviesInteractor: MoviesInteractorProtocol) {
        self.moviesInteractor = moviesInteractor
        super.init(wireframe: wireframe)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesInteractor.getPopularMovies()
        .loading(view: view)
        .handleError(presenter: self)
        .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
        .observeOn(MainScheduler.asyncInstance)
        .subscribe(onSuccess: { (movies) in
            self.view?.showMovies(movies)
        }).disposed(by: disposeBag)
    }
}
