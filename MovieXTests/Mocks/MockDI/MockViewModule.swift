//
//  MockViewModule.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

@testable import MovieX
import Foundation
import Swinject

class MockViewModule: ViewModule {
    
    override func setup(_ defaultContainer: Container) {
        self.resolvePresenters(defaultContainer)
        self.resolveViewControllers(defaultContainer)
    }
    
    override func resolvePresenters(_ defaultContainer: Container) {
        
        defaultContainer.register(Wireframe.self) { _ in
            MockWireframe()
        }
        
        defaultContainer.register(BasePresenter.self) { r in
            BasePresenter(wireframe: r.resolve(Wireframe.self)!)
        }
        
        defaultContainer.register(SplashPresenter.self) { r in
            MockSplashPresenter(wireframe: r.resolve(Wireframe.self)!)
        }
        
        defaultContainer.register(MoviesListPresenter.self) { r in
            MockMoviesListPresenter(wireframe: r.resolve(Wireframe.self)!,
                                    moviesInteractor: (r.resolve(MoviesInteractor.self)!))
        }
        
        defaultContainer.register(MovieDetailPresenter.self) { r in
            MockMovieDetailPresenter(wireframe: r.resolve(Wireframe.self)!,
                                     movie: Movie())
        }
    }
    
    override func resolveViewControllers(_ defaultContainer: Container) {
        
    }
}

