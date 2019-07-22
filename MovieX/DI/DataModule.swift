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

        defaultContainer.register(SingletonManager.self) { _ in
            SingletonManager.sharedInstance
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

        defaultContainer.register(UserRepository.self) { r in
            UserRepositoryImpl(networkManager: r.resolve(NetworkManager.self)!,
                               localManager: r.resolve(LocalManager.self)!,
                               singletonManager: r.resolve(SingletonManager.self)!)
        }

    }
    
    func resolveInteractors(_ defaultContainer: Container) {
        defaultContainer.register(UserInteractorProtocol.self) { r in
            UserInteractor(userRepository: r.resolve(UserRepository.self)!)
        }
    }
}
