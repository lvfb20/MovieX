//
//  MoviesListViewControllerSpec.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/31/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

@testable import MovieX
import Foundation
import Quick
import Nimble

class MoviesListViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        var subject: MoviesListViewController!
        var mockPresenter: MockMoviesListPresenter!
        
        //Global Setup/Teardown
        beforeSuite {
            //setup
            MockDI.mockDependencies()
        }
        
        afterSuite {
            //tearDown
        }
        
        describe("MoviesListViewController") {
            beforeEach {
                mockPresenter = MockDI.mockContainer.resolve(MoviesListPresenter.self) as? MockMoviesListPresenter
                subject = MoviesListViewController()
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
            }
            
            context("When view is loaded and has moviesToShow") {
                beforeEach {
                    subject = MoviesListViewController()
                    subject.presenter = mockPresenter
                    mockPresenter.movies = MoviesDataDummy.getMovies()
                    subject.preloadViewForTest()
                }
                
                it("tableView should have rows") {
                    let rows = subject.tableView(subject.tableView, numberOfRowsInSection: 0)
                    expect(rows).toEventually(equal(3))
                }
                
                it("MovieTableViewCell should be") {
                    let cell = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? MovieTableViewCell
                    expect(cell).toNot(beNil())
                    expect(cell?.titleLabel.text).to(equal("The Lion King"))
                }
                
                it("should call presentMovieDetail") {
                    subject.tableView(subject.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
                    expect(mockPresenter.didSelectRowCalled).to(beTrue())
                }
            }
            
            context("When view is loaded and movies is nil") {
                beforeEach {
                    subject = MoviesListViewController()
                    subject.presenter = mockPresenter
                    mockPresenter.movies = []
                    subject.preloadViewForTest()
                }
                
                it("tableView shouldn't have rows") {
                    let rows = subject.tableView(subject.tableView, numberOfRowsInSection: 0)
                    expect(rows).toEventually(equal(0))
                }
            }
        }
    }
}

