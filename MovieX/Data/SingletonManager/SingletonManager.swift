//
//  SingletonManager.swift
//  MovieX
//
//  Created by Legna Filloy on 6/21/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//

import Foundation

class SingletonManager {
    
    // MARK: Shared Instance
    
    static let sharedInstance: SingletonManager = {
        let instance = SingletonManager()
        return instance
    }()
    
    // MARK: Init
    
    private init() {
    }
    
    //If you need manage singleton
}

