//
//  AppDelegate.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        Style.configureAppearance()
        startNavigationIfNotTesting()
        
        #if LOCAL
            print("LOCAL")
        #elseif DEVELOPMENT
            print("DEVELOPMENT")
        #elseif PRODUCTION
            print("PRODUCTION")
        #endif
        
        
        return true
    }
}

extension AppDelegate {
    func startNavigationIfNotTesting() {
        guard NSClassFromString("XCTestCase") != nil else {
            guard let wireframe = SwinjectStoryboard.defaultContainer.resolve(Wireframe.self) else { return }
            wireframe.start()
            return
        }
    }
}
