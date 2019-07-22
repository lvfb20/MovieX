//
//  LoginBodyEntity.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import ObjectMapper

class LoginBodyEntity: Mappable {
    var user: UserEntity?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        user <- map["user"]
    }
}
