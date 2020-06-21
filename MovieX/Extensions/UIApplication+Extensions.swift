//
//  UIApplication+Extensions.swift
//  MovieX
//
//  Created by Legna Filloy on 6/21/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//

import UIKit

extension UIApplication {
    // Fix for iOS 13. Must implement a window variable in your AppDelegate
    var keyWindow: UIWindow? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        if appDelegate.window == nil {
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        }
        return appDelegate.window
    }
    
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}
