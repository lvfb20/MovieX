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
    
    func goToLogin()
    func goToHome()
    func showNoConecction()
    
}

class SplashViewController: BaseViewController<SplashPresenter> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
    
    @objc func retryClicked() {
        self.presenter.viewDidLoad()
    }
    
    func createNoConectionView() {
        self.view.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        let label = UILabel(frame: .zero)
        label.text = "No hay conexión"
        label.textAlignment = .center
        
        view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        let button = UIButton(frame: .zero)
        button.setTitle("reintentar", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(SplashViewController.retryClicked), for: .touchUpInside)
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(20)
        }
    }
    
}

extension SplashViewController: SplashView {
    
    func goToLogin() {
        Wireframe.presentLogin()
    }
    
    func goToHome() {
        Wireframe.presentTabsNavigationScreen()
    }
    
    func showNoConecction() {
        createNoConectionView()
    }
    
}

