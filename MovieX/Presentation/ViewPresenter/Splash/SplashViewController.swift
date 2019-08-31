//
//  SplashViewController.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit
import SnapKit

protocol SplashView: BaseView {
    func goToMoviesList()
}

class SplashViewController: BaseViewController<SplashPresenter> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}

extension SplashViewController: SplashView {
    
    func goToMoviesList() {
        wireframe.presentMoviesList()
    }
}
