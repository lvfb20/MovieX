//
//  Wireframe.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Swinject
import SwinjectStoryboard

protocol Wireframe {
    func start()
    func moviesList()
    func movieDetail(from vc: UIViewController, movie: Movie) -> Screen
}

final class WireframeImpl: Wireframe {
    
    func start() {
        guard let vc = SwinjectStoryboard.defaultContainer.resolve(SplashViewController.self) else {
            fatalError("Couldn't instantiate SplashViewController")
        }
        UIApplication.shared.keyWindow?.replaceRootViewControllerWith(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
     func moviesList() {
        guard let view = SwinjectStoryboard.defaultContainer.resolve(MoviesListViewController.self) else {
            fatalError("Couldn't instantiate MoviesListViewController")
        }
        let navVC = UINavigationController(rootViewController: view)
        UIApplication.shared.keyWindow?.replaceRootViewControllerWith(navVC, animated: true, completion: nil)
    }
    
    func movieDetail(from vc: UIViewController, movie: Movie) -> Screen {
        guard let vc = SwinjectStoryboard.defaultContainer.resolve(MovieDetailViewController.self, argument: movie ) else {
            fatalError("Couldn't instantiate MovieDetailViewController")
        }
        return Screen(viewController: vc, isModal: false, animated: true)
    }
}
