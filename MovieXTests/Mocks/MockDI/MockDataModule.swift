//
//  MockDataModule.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

@testable import MovieX
import Foundation
import Swinject

class MockDataModule: DataModule {
    
    override func setup(_ defaultContainer: Container) {
        self.resolveRepositories(defaultContainer)
        self.resolveInteractors(defaultContainer)
    }
    
    override func resolveRepositories(_ defaultContainer: Container) {
        
        defaultContainer.register(LocalManager.self) { _ in
            LocalManager()
        }
        
        defaultContainer.register(NetworkManager.self) { _ in
            MockNetworkManager()
        }
        
        defaultContainer.register(SingletonManager.self) { _ in
            SingletonManager.sharedInstance
        }
        
        defaultContainer.register(MoviesRepository.self) { r in
            MockMoviesRepository(networkManager: r.resolve(NetworkManager.self)!,
                                 localManager: r.resolve(LocalManager.self)!,
                                 singletonManager: r.resolve(SingletonManager.self)!)
        }
    }
    
    override func resolveInteractors(_ defaultContainer: Container) {
        defaultContainer.register(MoviesInteractor.self) { r in
            MockMoviesInteractor(moviesRepository: r.resolve(MoviesRepository.self)!)
        }
    }
}

