//
//  LoginRequest.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

class LoginRequest: BaseRequest {
    
    var email: String?
    var password: String?
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

