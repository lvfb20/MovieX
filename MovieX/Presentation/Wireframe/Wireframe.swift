//
//  Wireframe.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Swinject
import SwinjectStoryboard

open class Wireframe {
    
    static func startAppNavigation() {
        guard let view = SwinjectStoryboard.defaultContainer.resolve(SplashViewController.self) else { return }
        let splashNavVC = UINavigationController(rootViewController: view)
        self.getWindow().rootViewController = splashNavVC
        self.getWindow().makeKeyAndVisible()
    }
    
     func presentMoviesList() {
        guard let view = SwinjectStoryboard.defaultContainer.resolve(MoviesListViewController.self) else { return }
        let navVC = UINavigationController(rootViewController: view)
        Wireframe.newRootViewController(navVC)
    }
    
    func presentMovieDetail(from vc: UIViewController, movie: Movie) {
        guard let view = SwinjectStoryboard.defaultContainer.resolve(MovieDetailViewController.self, argument: movie ) else { return }
        vc.navigationController?.pushViewController(view, animated: true)
    }
}

extension Wireframe {
    
    private static func newRootViewController(_ vc: UIViewController) {
        let window = self.getWindow()
        if let root = window!.rootViewController {
            root.presentedViewController?.dismiss(animated: false, completion: nil)
            for view in root.view.subviews {
                view.removeFromSuperview()
            }
            root.view.removeFromSuperview()
        }
        window!.rootViewController = vc
        window!.makeKeyAndVisible()
        window!.backgroundColor = .white
    }
    
    internal static func getWindow() -> UIWindow! {
        let appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        
        if appDelegate.window == nil {
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        }
        return appDelegate.window!
    }
    
    static func getVCFromStoryBoard<Subject>(_ viewControllerClass: Subject, storyBoard: UIStoryboard) -> UIViewController {
        return storyBoard.instantiateViewController(withIdentifier: String(describing: viewControllerClass))
    }
}
