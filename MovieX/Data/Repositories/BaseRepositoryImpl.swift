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
 
    init(networkManager: NetworkManager, localManager: LocalManager) {
        self.networkManager = networkManager
        self.localManager = localManager
    }
    
    
    func getLocalManager() -> LocalManager {
        return localManager
    }
    
    func fillBaseRequest<P>(_ baseRequest: P) -> P where P: BaseRequest {
        baseRequest.deviceModel = UIDevice.current.model
        baseRequest.deviceOS = UIDevice.current.systemName
        baseRequest.deviceVersion = UIDevice.current.systemVersion
        baseRequest.deviceId = UIDevice.current.identifierForVendor?.uuidString ?? ""
        
        return baseRequest
    }
    
}
