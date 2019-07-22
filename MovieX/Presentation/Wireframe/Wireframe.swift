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
    
    static func presentTabsNavigationScreen() {
        
        let tab1View = ViewController()
        tab1View.view.backgroundColor = .brown
        
        let tab1Nav = UINavigationController(rootViewController: tab1View)
        
        let tab2View = ViewController()
        tab2View.view.backgroundColor = .yellow
        
        let tab2Nav = UINavigationController(rootViewController: tab2View)
        
        let tab3View = ViewController()
        tab3View.view.backgroundColor = .blue
        
        let tab3Nav = UINavigationController(rootViewController: tab3View)
        
        // TABS
        let tabsVC = TabsViewController()
        tabsVC.viewControllers =  [tab1Nav, tab2Nav, tab3Nav]
        tabsVC.selectedIndex = 0
        
        newRootViewController(tabsVC)
        
    }
    
    static func presentLogin() {
        guard let view = SwinjectStoryboard.defaultContainer.resolve(LoginViewController.self) else { return }
        self.getWindow().rootViewController = UINavigationController(rootViewController: view)
        self.getWindow().makeKeyAndVisible()
    }
}

extension Wireframe {
    
    private static func newRootViewController(_ vc: UIViewController) {
        // Esto es necessario para que no se queden atras los presented
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

