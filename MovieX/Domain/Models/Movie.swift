//
//  Movie.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

class Movie {
    var id: Int?
    var title: String?
    var originalTitle: String?
    var overview: String?
    var releaseDate: Date?
    var posterPath: String?
    var backDropPath: String?
    
    init() {}
    
    func getThumbnail() -> String? {
        guard let poster = self.posterPath else { return nil }
        return "https://image.tmdb.org/t/p/w154" + poster
    }
    
    func getPoster() -> String? {
        guard let poster = self.posterPath else { return nil }
        return "https://image.tmdb.org/t/p/w300" + poster
    }
    
    func getBackdrop() -> String? {
        guard let backDropPath = self.backDropPath else { return nil }
        return "https://image.tmdb.org/t/p/w300" + backDropPath
    }
}

//extension MovieEntity {
//    func parseToModel() -> Movie {
//        let movie = Movie()
//        movie.id = self.id
//        movie.title = self.title
//        movie.originalTitle = self.originalTitle
//        movie.overview = self.overview
//        movie.posterPath = self.posterPath
//        movie.backDropPath = self.backDropPath
//        if let releaseDate = self.releaseDate {
//            movie.releaseDate = Date(string: releaseDate, formatter: .yearMonthAndDay)
//        }
//        return movie
//    }
//}
