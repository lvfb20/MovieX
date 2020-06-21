//
//  DataModule.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Swinject

class DataModule {
    
    func setup(_ defaultContainer: Container) {
        self.resolveManagers(defaultContainer)
        self.resolveRepositories(defaultContainer)
        self.resolveInteractors(defaultContainer)
    }
    
    func resolveManagers(_ defaultContainer: Container) {

        defaultContainer.register(LocalManager.self) { _ in
            LocalManager()
        }
        defaultContainer.register(SingletonManager.self) { _ in
            SingletonManager.sharedInstance
        }
        defaultContainer.register(NetworkManager.self) { _ in
            var env: NetworkEnvironment = .development
                #if DEVELOPMENT
                    env = .development
                #else
                    env = .production
                #endif
            return NetworkManager(environment: env)
        }
    }
    
    func resolveRepositories(_ defaultContainer: Container) {

        defaultContainer.register(BaseRepository.self) { r in
            BaseRepositoryImpl(networkManager: r.resolve(NetworkManager.self)!,
                               localManager: r.resolve(LocalManager.self)!,
                               singletonManager: r.resolve(SingletonManager.self)!)
        }
        defaultContainer.register(MoviesRepository.self) { r in
            MoviesRepositoryImpl(networkManager: r.resolve(NetworkManager.self)!,
                                 localManager: r.resolve(LocalManager.self)!,
                                 singletonManager: r.resolve(SingletonManager.self)!)
        }
    }
    
    func resolveInteractors(_ defaultContainer: Container) {
        defaultContainer.register(MoviesInteractor.self) { r in
            MoviesInteractorImpl(moviesRepository: r.resolve(MoviesRepository.self)!)
        }
    }
}
