//
//  MovieEntity.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

class MovieEntity: Codable {
    
    var id: Int?
    var title: String?
    var originalTitle: String?
    var overview: String?
    var releaseDate: String?
    var posterPath: String?
    var backDropPath: String?
    
   enum CodingKeys: String, CodingKey {
       case originalTitle = "original_title"
       case releaseDate = "release_date"
       case posterPath = "poster_path"
       case backDropPath = "backdrop_path"
       case id
       case title
       case overview
   }
}

