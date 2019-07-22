//
//  ViewModule.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Swinject

// swiftlint:disable identifier_name function_body_length

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

        defaultContainer.register(SplashPresenter.self) { r in
            SplashPresenter(userIteractor: r.resolve(UserInteractorProtocol.self)!)
        }

        defaultContainer.register(LoginPresenter.self) { r in
            LoginPresenter(userIteractor: r.resolve(UserInteractorProtocol.self)!)
        }
    }
    
    func resolveViewControllers(_ defaultContainer: Container) {
        
        // To make your life easier -> Use this while registering a VC
        func register<P>(vc: BaseViewController<P>.Type) {
            defaultContainer.storyboardInitCompleted(vc) { r, c in
                c.presenter = r.resolve(vc.Presenter.self)!
                c.wireframe = r.resolve(Wireframe.self)!
            }
        }

        // Si el viewcontroller esta en el storyboard, se puede usar este metodo. Si no entonces se hace manual
        //register(vc: ProductListViewController.self)

        defaultContainer.register(SplashViewController.self) { r in
            let view = SplashViewController()
            view.presenter = r.resolve(SplashPresenter.self)!
            view.wireframe = r.resolve(Wireframe.self)!
            return view
        }

        defaultContainer.register(LoginViewController.self) { r in
            let view = LoginViewController()
            view.presenter = r.resolve(LoginPresenter.self)!
            view.wireframe = r.resolve(Wireframe.self)!
            return view
        }
        
    }
    
}

