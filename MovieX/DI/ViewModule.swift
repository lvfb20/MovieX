//
//  ViewModule.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Swinject

class ViewModule {
    func setup(_ defaultContainer: Container) {
        self.resolvePresenters(defaultContainer)
        self.resolveViewControllers(defaultContainer)
    }
    
    func resolvePresenters(_ defaultContainer: Container) {
        defaultContainer.register(Wireframe.self) { _ in
            WireframeImpl()
        }
        defaultContainer.register(BasePresenter.self) { r in
            BasePresenter(wireframe: r.resolve(Wireframe.self)!)
        }
        defaultContainer.register(SplashPresenter.self) { r in
            SplashPresenter(wireframe: r.resolve(Wireframe.self)!)
        }
        defaultContainer.register(MoviesListPresenter.self) { r in
            MoviesListPresenter(wireframe: r.resolve(Wireframe.self)!, moviesInteractor: r.resolve(MoviesInteractor.self)!)
        }
        defaultContainer.register(MovieDetailPresenter.self) { (r, movie: Movie) in
            MovieDetailPresenter(wireframe: r.resolve(Wireframe.self)!, movie: movie)
        }
    }
    
    func resolveViewControllers(_ defaultContainer: Container) {
        defaultContainer.register(SplashViewController.self) { r in
            let view = SplashViewController()
            view.presenter = r.resolve(SplashPresenter.self)!
            return view
        }
        defaultContainer.register(MoviesListViewController.self) { r in
            let view = MoviesListViewController()
            view.presenter = r.resolve(MoviesListPresenter.self)!
            return view
        }
        defaultContainer.register(MovieDetailViewController.self) { (r: Resolver, movie: Movie) in
            let view = MovieDetailViewController()
            view.presenter = r.resolve(MovieDetailPresenter.self, argument: movie)!
            return view
        }
    }
}
