//
//  UserEntity.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import ObjectMapper

class UserEntity: Mappable {
    
    var loginToken: String?
    var userId: Int?
    var email: String?
    var name: String?
    var lastName: String?
    var birthdate: String?
    var pictureToken: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        loginToken    <- map["loginToken"]
        userId        <- map["userId"]
        email         <- map["email"]
        name          <- map["name"]
        lastName      <- map["lastName"]
        birthdate     <- map["birthdate"]
        pictureToken  <- map["pictureToken"]
    }
}

