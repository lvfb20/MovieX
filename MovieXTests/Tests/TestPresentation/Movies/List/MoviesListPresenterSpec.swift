//
//  MoviesListPresenterSpec.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/31/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

@testable import MovieX
import Quick
import Nimble

class MoviesListPresenterSpec: QuickSpec {
    
    override func spec() {
        var subject: MoviesListPresenter?
        var mockMoviesInteractor: MockMoviesInteractor?
        var mockMoviesListVC: MockMoviesListViewController?
        
        //Global Setup/Teardown
        beforeSuite {
            //setup
            MockDI.mockDependencies()
            
            mockMoviesInteractor = MockDI.mockContainer.resolve(MoviesInteractorProtocol.self) as? MockMoviesInteractor
            subject = MoviesListPresenter(moviesInteractor: mockMoviesInteractor!)
            
            mockMoviesListVC = MockMoviesListViewController()
            mockMoviesListVC!.presenter = subject
        }
        
        afterSuite {
            //tearDown
        }
        
        describe("MoviesListPresenterSpec") {
            
            context("When view is loaded") {
                beforeEach {
                    mockMoviesListVC?.preloadViewForTest()
                }
                
                it("subject should not be nil") {
                    expect(subject).toNot(beNil())
                }
                
                it("should call popularMovies") {
                    expect(mockMoviesInteractor?.getPopularMoviesCalled).to(beTrue())
                }
            }
            
            context("When popularMovies exists") {
                beforeEach {
                    mockMoviesInteractor = MockDI.mockContainer.resolve(MoviesInteractorProtocol.self) as? MockMoviesInteractor
                    mockMoviesInteractor?.getPopularMoviesData = MoviesDataDummy.getMovies()
                    subject = MoviesListPresenter(moviesInteractor: mockMoviesInteractor!)
                    
                    mockMoviesListVC = MockMoviesListViewController()
                    mockMoviesListVC!.presenter = subject
                    mockMoviesListVC?.preloadViewForTest()
                }
                
                it("should display movies on screen") {
                    expect(mockMoviesListVC?.showMoviesCalled).to(beTrue())
                }
            }
            
            context("When popularMovies not exists") {
                beforeEach {
                    mockMoviesInteractor = MockDI.mockContainer.resolve(MoviesInteractorProtocol.self) as? MockMoviesInteractor
                    subject = MoviesListPresenter(moviesInteractor: mockMoviesInteractor!)
                    
                    mockMoviesListVC = MockMoviesListViewController()
                    mockMoviesListVC!.presenter = subject
                    mockMoviesListVC?.preloadViewForTest()
                }
                
                it("should display alert") {
                    expect(mockMoviesListVC?.fc_showNativeAlert).to(beTrue())
                }
            }
        }
    }
}

