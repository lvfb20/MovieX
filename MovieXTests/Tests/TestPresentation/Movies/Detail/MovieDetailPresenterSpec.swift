//
//  MovieDetailPresenterSpec.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/31/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

@testable import MovieX
import Quick
import Nimble

class MovieDetailPresenterSpec: QuickSpec {
    
    override func spec() {
        var subject: MovieDetailPresenter?
        var mockMovieDetailVC: MockMovieDetailViewController?
        
        //Global Setup/Teardown
        beforeSuite {
            //setup
            MockDI.mockDependencies()
            subject = MovieDetailPresenter(movie: MoviesDataDummy.getMovies().first!)
            mockMovieDetailVC = MockMovieDetailViewController()
            mockMovieDetailVC!.presenter = subject
        }
        
        afterSuite {
            //tearDown
        }
        
        describe("MoviesListPresenterSpec") {
            
            context("When view is loaded") {
                beforeEach {
                    mockMovieDetailVC?.preloadViewForTest()
                }
                
                it("subject should not be nil") {
                    expect(subject).toNot(beNil())
                }
                
                it("should call showDetails") {
                    expect(mockMovieDetailVC?.showDetailsCalled).to(beTrue())
                }
            }
        }
    }
}


