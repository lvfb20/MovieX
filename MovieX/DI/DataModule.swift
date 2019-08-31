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
        self.resolveRepositories(defaultContainer)
        self.resolveInteractors(defaultContainer)
    }
    
    func resolveRepositories(_ defaultContainer: Container) {

        defaultContainer.register(LocalManager.self) { _ in
            LocalManager()
        }

        defaultContainer.register(NetworkManager.self) { _ in

            let env: NetworkEnvironment = .development

            //            #if DEVELOPMENT
            //                env = .development
            //            #else
            //                env = .production
            //            #endif

            return NetworkManager(environment: env)
        }

        defaultContainer.register(MoviesRepository.self) { r in
            MoviesRepositoryImpl(networkManager: r.resolve(NetworkManager.self)!,
                               localManager: r.resolve(LocalManager.self)!)
        }
    }
    
    func resolveInteractors(_ defaultContainer: Container) {
        defaultContainer.register(MoviesInteractorProtocol.self) { r in
            MoviesInteractor(moviesRepository: r.resolve(MoviesRepository.self)!)
        }
    }
}
