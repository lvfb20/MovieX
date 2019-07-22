//
//  UserInteractorProtocol.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

protocol UserInteractorProtocol {
    
}

class UserInteractor: BaseInteractor, UserInteractorProtocol {
    
    private var userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
}
