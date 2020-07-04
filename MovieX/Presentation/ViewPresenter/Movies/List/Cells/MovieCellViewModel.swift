//
//  MovieCellViewModel.swift
//  MovieX
//
//  Created by Legna Filloy on 7/4/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//

import Foundation

class MovieCellViewModel: CellViewModel {
    let title: String?
    let posterImage: String?
    
    init(title: String?, posterImage: String?) {
        self.title = title
        self.posterImage = posterImage
    }
}
