//
//  BaseInteractor.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
import SwinjectStoryboard

enum InteractorError: Swift.Error {
    case general
    case generalWith(text: String)
    case noSession
    case noConecction
}

protocol BaseInteractorProtocol {
    
}

class BaseInteractor: BaseInteractorProtocol {
    
    //private var baseUserRepo: UsersRepository
    //private var baseGeneralRepo: GeneralRepository
    
    //init(user: UsersRepository, general: GeneralRepository) {
    //    self.baseUserRepo = user
    //    self.baseGeneralRepo = general
    //}
    
}
