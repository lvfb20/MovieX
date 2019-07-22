//
//  BaseResponse.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import ObjectMapper

class BaseResponse: Mappable {
    
    var status: Int?
    var message: String?
    
    init() { }
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
    }
}

class BaseResponseWithBody<T>: BaseResponse where T: Mappable {
    
    var body: T?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        body <- map["body"]
    }
}
