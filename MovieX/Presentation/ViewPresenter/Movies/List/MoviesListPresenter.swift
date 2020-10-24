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
    
    private var moviesInteractor: MoviesInteractor
    private var movies: [Movie] = []
    var viewModels: [MovieCellViewModel] = []

    init(wireframe: Wireframe,
         moviesInteractor: MoviesInteractor) {
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
        .subscribe(onSuccess: { [weak self] (movies) in
            self?.movies = movies
            self?.buildViewModels()
        }).disposed(by: disposeBag)
    }
    
    func buildViewModels() {
        viewModels = movies.map({MovieCellViewModel(title: $0.title, posterImage: $0.getThumbnail())})
        view?.reloadMovies()
    }
    
    func numberOfRows(in section: Int) -> Int {
        return viewModels.count
    }
    
    func getViewModel(at index: Int) -> MovieCellViewModel {
        return viewModels[index]
    }
    
    private func getMovie(at index: Int) -> Movie {
        let movie = movies[index]
        return movie
    }
    
    func didSelectRow(at index: Int) {
        view?.showMovieDetail(movie: getMovie(at: index))
    }
}
