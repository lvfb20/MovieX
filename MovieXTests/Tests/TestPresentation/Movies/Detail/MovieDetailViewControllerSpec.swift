//
//  MovieDetailViewControllerSpec.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/31/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
@testable import MovieX
import Quick
import Nimble

class MovieDetailViewControllerSpec: QuickSpec {
    override func spec() {
        
        var subject: MovieDetailViewController!
        var mockPresenter: MockMovieDetailPresenter!
  
        //Global Setup/Teardown
        beforeSuite {
            //setup
            MockDI.mockDependencies()
        }
        
        afterSuite {
            //tearDown
        }
        
        describe("MovieDetailViewController") {
            beforeEach {
                mockPresenter = MockDI.mockContainer.resolve(MovieDetailPresenter.self) as? MockMovieDetailPresenter
                mockPresenter.movieToShow = MoviesDataDummy.getMovies().first
                subject = MovieDetailViewController()
                subject.presenter = mockPresenter
                subject.preloadViewForTest()
            }
            
            context("When view is loaded") {
                it("presenter should not be nil") {
                    expect(mockPresenter).toNot(beNil())
                }
                
                it("should call presenterViewDidLoad") {
                    expect(mockPresenter.viewDidLoadCalled).to(beTrue())
                }
                
                it("should set values on screen") {
                    expect(subject.movieTitleLabel.text).to(equal("The Lion King"))
                }
            }
        }
    }
}
