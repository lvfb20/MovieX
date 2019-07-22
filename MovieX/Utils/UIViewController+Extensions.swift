//
//  UIViewController+Extensions.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func loadNibFor<Subject>(viewControllerClass: Subject) {
        loadNib(name: String(describing: viewControllerClass))
    }
    
    func loadNib(name: String) {
        let customView = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView
        customView?.frame = self.view.bounds
        customView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(customView!)
    }
    
    func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func showNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
}
