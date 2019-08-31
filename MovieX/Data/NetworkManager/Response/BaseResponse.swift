//
//  BaseResponse.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import ObjectMapper

class BaseResponse: Mappable {
    var status: Int?
    var message: String?
    
    init() { }
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        status <- map["status_code"]
        message <- map["status_message"]
    }
}
