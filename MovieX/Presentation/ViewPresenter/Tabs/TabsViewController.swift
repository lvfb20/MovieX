//
//  TabsViewController.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit

class TabsViewController: UITabBarController {
    
    // -------------------------------------
    // MARK: Section - UIViewController
    // -------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTabBarItems()
    }
    
    // -------------------------------------
    // MARK: Section - Private Methods
    // -------------------------------------
    
    private func configureTabBarItems() {
        
        let titles: [String] = ["title1", "title2", "title3"]
        let imagesOff: [String] = ["", "", ""]
        
        for index in 0..<titles.count {
            let tab = UITabBarItem(title: titles[index].locale(),
                                   image: UIImage(named: imagesOff[index]),
                                   selectedImage: UIImage(named: imagesOff[index]))
            self.viewControllers?[index].tabBarItem = tab
        }
        self.tabBar.tintColor = UIColor.lightGreyBlue
    }
    
}
