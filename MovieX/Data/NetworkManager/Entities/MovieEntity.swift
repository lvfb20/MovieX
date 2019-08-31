//
//  MovieEntity.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieEntity: Mappable {
    
    var id: Int?
    var title: String?
    var originalTitle: String?
    var overview: String?
    var releaseDate: String?
    var posterPath: String?
    var backDropPath: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        releaseDate <- map["release_date"]
        posterPath <- map["poster_path"]
        backDropPath <- map["backdrop_path"]
    }
}

