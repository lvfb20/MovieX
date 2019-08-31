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
    
    override func viewDidLoad() {
        // Aqui se puede pedir data importante y mientras mostrar un splash animado
        // una vez se reciba la data, se direcciona
        view?.goToMoviesList()
    }
    
}
