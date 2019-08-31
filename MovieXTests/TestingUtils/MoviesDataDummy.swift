//
//  MoviesDataDummy.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/31/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
@testable import MovieX

class MoviesDataDummy {
    
    static func getMovies() -> [Movie] {
        let movie1 = Movie()
        movie1.id = 1
        movie1.title = "The Lion King"
        movie1.originalTitle = "The Lion King"
        movie1.overview = "Simba idolises his father, King Mufasa, and takes to heart his own royal destiny. But not everyone in the kingdom celebrates the new cub's arrival. Scar, Mufasa's brother—and former heir to the throne—has plans of his own. The battle for Pride Rock is ravaged with betrayal, tragedy and drama, ultimately resulting in Simba's exile. With help from a curious pair of newfound friends, Simba will have to figure out how to grow up and take back what is rightfully his."
        movie1.releaseDate = Date()
        movie1.posterPath = ""
        movie1.backDropPath = ""
        
        let movie2 = Movie()
        movie2.id = 2
        movie2.title = "Fast & Furious Presents: Hobbs & Shaw"
        movie2.originalTitle = "Fast & Furious Presents: Hobbs & Shaw"
        movie2.overview = "A spinoff of The Fate of the Furious, focusing on Johnson's US Diplomatic Security Agent Luke Hobbs forming an unlikely alliance with Statham's Deckard Shaw."
        movie2.releaseDate = Date()
        movie2.posterPath = ""
        movie2.backDropPath = ""
        
        let movie3 = Movie()
        movie3.id = 3
        movie3.title = "Aladdin"
        movie3.originalTitle = "Aladdin"
        movie3.overview = "A kindhearted street urchin named Aladdin embarks on a magical adventure after finding a lamp that releases a wisecracking genie while a power-hungry Grand Vizier vies for the same lamp that has the power to make their deepest wishes come true."
        movie3.releaseDate = Date()
        movie3.posterPath = ""
        movie3.backDropPath = ""
        
        return [movie1, movie2, movie3]
    }
}
