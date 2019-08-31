//
//  MockWireframe.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/31/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit
@testable import MovieX

class MockWireframe: Wireframe {
    
    // -------------------------------------
    // MARK: Section - Testing vars
    // -------------------------------------
    
    var presentMoviesListCalled = false
    var presentMovieDetailCalled = false
    
    // -------------------------------------
    // MARK: Section - Functions
    // -------------------------------------
    
    override func presentMoviesList() {
        presentMoviesListCalled = true
    }
    
    override func presentMovieDetail(from vc: UIViewController, movie: Movie) {
        presentMovieDetailCalled = true
    }
}
