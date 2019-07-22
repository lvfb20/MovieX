//
//  BaseRepositoryImpl.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Moya

class BaseRepositoryImpl: BaseRepository {
    
    let networkManager: NetworkManager
    private let localManager: LocalManager
    private let singletonManager: SingletonManager
    
    init(networkManager: NetworkManager, localManager: LocalManager, singletonManager: SingletonManager) {
        self.networkManager = networkManager
        self.localManager = localManager
        self.singletonManager = singletonManager
    }
    
    func getSingleton() -> SingletonManager {
        return singletonManager
    }
    
    func getLocalManager() -> LocalManager {
        return localManager
    }
    
    func fillBaseRequest<P>(_ baseRequest: P) -> P where P: BaseRequest {
        baseRequest.deviceModel = UIDevice.current.model
        baseRequest.deviceOS = UIDevice.current.systemName
        baseRequest.deviceVersion = UIDevice.current.systemVersion
        baseRequest.deviceId = UIDevice.current.identifierForVendor?.uuidString ?? ""
        
        if let user = localManager.getUser() {
            baseRequest.loginToken = user.loginToken
        }
        return baseRequest
    }
    
}
