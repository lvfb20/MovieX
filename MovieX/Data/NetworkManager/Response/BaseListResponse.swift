//
//  BaseListResponse.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import ObjectMapper

class BaseListResponse: BaseResponse {
    
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?

    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
    }
}

class BaseListResponseWithBody<T>: BaseListResponse where T: Mappable {
    
    var results: [T]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        results <- map["results"]
    }
}
