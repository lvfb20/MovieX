//
//  MoviesInteractorSpec.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/31/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

@testable import MovieX
import Quick
import Nimble
import RxSwift

class MoviesInteractorSpec: QuickSpec {
    
    var disposeBag: DisposeBag!
    var mockMoviesRepository: MockMoviesRepository?
    var moviesInteractor: MoviesInteractorProtocol?
    
    override func spec() {
        
        beforeSuite {
            MockDI.mockDependencies()
            self.disposeBag = DisposeBag()
            self.mockMoviesRepository = MockDI.mockContainer.resolve(MoviesRepository.self) as? MockMoviesRepository
            self.moviesInteractor = MoviesInteractor(moviesRepository: self.mockMoviesRepository!)
        }
        
        afterSuite {}
        
        describe("MoviesInteractor") {
            context("when popularMovies is requested (success case)") {
                it("should request movies") {
                    self.mockMoviesRepository?.getPopularMoviesData = MoviesDataDummy.getMovies()
                    let expectation = self.expectation(description: "wait for popularMovies response")
                    self.mockMoviesRepository?.getPopularMovies()
                        .subscribe(onSuccess: { (movies) in
                            expect(movies).toNot(beNil())
                            expectation.fulfill()
                        }, onError: nil).disposed(by: self.disposeBag)
                    
                    self.wait(for: [expectation], timeout: 0.1)
                }
            }
            
            context("when popularMovies is requested (failure case)") {
                it("should get error") {
                    self.mockMoviesRepository?.getPopularMoviesData = nil
                    let expectation = self.expectation(description: "wait for popularMovies response")
                    self.mockMoviesRepository?.getPopularMovies()
                        .subscribe(onSuccess: { (movies) in
                            expect(movies).to(beNil())
                            expectation.fulfill()
                        }, onError: {(error) in
                            expect(error).toNot(beNil())
                            expectation.fulfill()
                        }).disposed(by: self.disposeBag)
                    
                    self.wait(for: [expectation], timeout: 0.1)
                }
            }
        }
    }
    
}

