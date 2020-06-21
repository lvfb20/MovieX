//
//  BaseRepository.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

protocol BaseRepository {
    func getSingleton() -> SingletonManager
    func getLocalManager() -> LocalManager
    func fillBaseRequest<P>(_ baseRequest: P) -> P where P: BaseRequest
}

