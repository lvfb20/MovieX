//
//  UIWindow+Extensions.swift
//  MovieX
//
//  Created by Legna Filloy on 6/21/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//

import UIKit

/// More information: https://stackoverflow.com/a/34679549

extension UIView {
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
}

extension UIWindow {
    func replaceRootViewControllerWith(_ replacementController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        
        // In case this is the first Root VC to be inserted in the view's hierarchy
        guard let rootVC = self.rootViewController else {
            self.rootViewController = replacementController
            self.makeKeyAndVisible()
            return
        }
        
        // Take a snapshot of current view, before removing it from the hierarchy to be
        // able to do a smooth transition.
        let snapshotImageView = UIImageView(image: self.snapshot())
        self.addSubview(snapshotImageView)

        // Dismiss all modal view controllers. We have to do this because if the rootViewController
        // was presenting another viewcontroller modally, this one will remain in the window hierarchy
        // even after you replace the rootViewController (unless you dismiss it first).
        let dismissCompletion = { () -> Void in
            self.rootViewController = replacementController
            self.bringSubviewToFront(snapshotImageView)
            self.makeKeyAndVisible()
            if animated {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    snapshotImageView.alpha = 0
                }, completion: { _ -> Void in
                    snapshotImageView.removeFromSuperview()
                    completion?()
                })
            } else {
                snapshotImageView.removeFromSuperview()
                completion?()
            }
        }
        
        if rootVC.presentedViewController != nil {
            rootVC.dismiss(animated: false, completion: dismissCompletion)
        } else {
            dismissCompletion()
        }
    }
}
