//
//  MoviesFactory.swift
//  MovieX
//
//  Created by Legna Filloy on 6/21/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//
import Foundation

final class MoviesFactory {
    
    // MARK: - Movie
    static func newMovie(with response: MovieEntity) throws -> Movie {
        guard let id = response.id else {
            throw MovieXError.parsing(message: "Movie doesn't have a valid id.")
        }
        
        let movie = Movie()
        movie.id = id
        movie.title = response.title
        movie.originalTitle = response.originalTitle
        movie.overview = response.overview
        movie.posterPath = response.posterPath
        movie.backDropPath = response.backDropPath
        if let releaseDate = response.releaseDate {
            movie.releaseDate = Date(string: releaseDate, formatter: .yearMonthAndDay)
        }
        return movie
    }
}
