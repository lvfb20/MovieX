//
//  SingletonManager.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

class SingletonManager {
    
    // -------------------------------------
    // MARK: Section - Private Variables
    // -------------------------------------
    
    // -------------------------------------
    // MARK: Section - Shared Instance
    // -------------------------------------
    
    static let sharedInstance: SingletonManager = {
        let instance = SingletonManager()
        return instance
    }()
    
    // -------------------------------------
    // MARK: Section - Init
    // -------------------------------------
    
    private init() {
        clearAll()
    }
    
    // -------------------------------------
    // MARK: Section - Methods
    // -------------------------------------
    
    //
    // Globals
    func clearAll() {
    }
    
}

