//
//  LocalManager.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

class LocalManager {
    
    // -------------------------------------
    // MARK: Section - Keys
    // -------------------------------------
    
    private let userKey = "LocalManager.user"
    
    // -------------------------------------
    // MARK: Section - Vars
    // -------------------------------------
    
    // -------------------------------------
    // MARK: Section - Common info
    // -------------------------------------
    
    func clearAll() {
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
    
    // -------------------------------------
    // MARK: Section - User Defaults
    // -------------------------------------
    
    func saveUser(_ user: UserLocal) {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    func getUser() -> UserLocal? {
        
        let data = UserDefaults.standard.object(forKey: userKey)
        if let userData = data as? Data {
            if let user = try? JSONDecoder().decode(UserLocal.self, from: userData) {
                return user
            }
        }
        return nil
    }
}
