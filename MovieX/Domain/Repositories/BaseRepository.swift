//
//  BaseRepository.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

enum RepositoryError: Swift.Error {
    case general
    case parsing
    case unauthorized
}

protocol BaseRepository {
    func getLocalManager() -> LocalManager
    func fillBaseRequest<P>(_ baseRequest: P) -> P where P: BaseRequest
}

