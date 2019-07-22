//
//  SplashPresenter.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

class SplashPresenter: BasePresenter {
    
    internal var view: SplashView? {
        return baseView as? SplashView
    }
    
    private var userIteractor: UserInteractorProtocol
    
    init(userIteractor: UserInteractorProtocol) {
        self.userIteractor = userIteractor
    }
    
    override func viewDidLoad() {
    }
    
}

