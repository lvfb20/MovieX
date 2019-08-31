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
            Wireframe()
        }

        defaultContainer.register(BasePresenter.self) { _ in
            BasePresenter()
        }

        defaultContainer.register(SplashPresenter.self) { _ in
            SplashPresenter()
        }
        
        defaultContainer.register(MoviesListPresenter.self) { r in
            MoviesListPresenter(moviesInteractor: r.resolve(MoviesInteractorProtocol.self)!)
        }
        
        defaultContainer.register(MovieDetailPresenter.self) { (_, movie: Movie) in
            MovieDetailPresenter(movie: movie)
        }
    }
    
    func resolveViewControllers(_ defaultContainer: Container) {
        defaultContainer.register(SplashViewController.self) { r in
            let view = SplashViewController()
            view.presenter = r.resolve(SplashPresenter.self)!
            view.wireframe = r.resolve(Wireframe.self)!
            return view
        }
        
        defaultContainer.register(MoviesListViewController.self) { r in
            let view = MoviesListViewController()
            view.presenter = r.resolve(MoviesListPresenter.self)!
            view.wireframe = r.resolve(Wireframe.self)!
            return view
        }
        
        defaultContainer.register(MovieDetailViewController.self) { (r: Resolver, movie: Movie) in
            let view = MovieDetailViewController()
            view.presenter = r.resolve(MovieDetailPresenter.self, argument: movie)!
            view.wireframe = r.resolve(Wireframe.self)!
           return view
        }
    }
}
