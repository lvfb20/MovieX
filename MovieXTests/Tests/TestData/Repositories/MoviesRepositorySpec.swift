//
//  MoviesRepositorySpec.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/31/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
@testable import MovieX
import Quick
import Nimble
import RxSwift
import Moya

class MoviesRepositorySpec: QuickSpec {
    
    var disposeBag: DisposeBag!
    var mockLocalMananger: LocalManager!
    var mockNetworkManager: MockNetworkManager!
    var moviesRepository: MoviesRepository!
    var mockSingletonManager: SingletonManager!
    
    override func spec() {
        
        beforeSuite {
            MockDI.mockDependencies()
            self.disposeBag = DisposeBag()
        }
        
        afterSuite {
        }
        
        describe("MoviesRepository") {
            beforeEach {
                self.mockSingletonManager = MockDI.mockContainer.resolve(SingletonManager.self)!
                self.mockLocalMananger = MockDI.mockContainer.resolve(LocalManager.self)!
                self.mockNetworkManager = MockDI.mockContainer.resolve(NetworkManager.self) as? MockNetworkManager
                self.moviesRepository = MoviesRepositoryImpl(networkManager: self.mockNetworkManager,
                                                             localManager: self.mockLocalMananger,
                                                             singletonManager: self.mockSingletonManager)
            }
            context("When popularMovies success") {
                it("should return movies") {
                    let data = TestingUtils.parseJsonFileToData(filename: "popularMoviesSuccess")
                    self.mockNetworkManager.responseToMock = Response(statusCode: 200, data: data!)
                    
                    let expectation = self.expectation(description: "wait for popularMovies response")
                    self.moviesRepository.getPopularMovies()
                        .subscribe(onSuccess: { (movies) in
                            expect(movies).toNot(beNil())
                          
                            let targetToTest = self.mockNetworkManager.targetToRequest as! MoviesTarget
                            var request = BaseRequest()
                            request = self.moviesRepository.fillBaseRequest(request)
                            
                            let targetExpected = MoviesTarget.popularMovies(request: request)
                            expect(targetToTest.checkIfEquals(target: targetExpected)).to(beTrue())
                            expectation.fulfill()
                        }, onError: nil).disposed(by: self.disposeBag)
                    
                    self.wait(for: [expectation], timeout: 0.1)
                }
            }
            
            context("When popularMovies error") {
                it("should return error") {
                    let statusCode = 404
                    let statusCodeApi = 34
                    let data = TestingUtils.parseJsonFileToData(filename: "popularMoviesError")
                    self.mockNetworkManager.responseToMock = Response(statusCode: statusCode, data: data!)
                    
                    let expectation = self.expectation(description: "wait for popularMovies response")
                    self.moviesRepository.getPopularMovies()
                        .subscribe(onSuccess: { (movies) in
                            expect(movies).to(beNil())
                        }, onError: {(error) in
                            expect(error).toNot(beNil())
                            
                            if let moyaError = error as? MoyaError,
                                let code = moyaError.response?.statusCode {
                                expect(code).to(equal(statusCode))
                                
                                if let data = moyaError.response?.data {
                                    do {
                                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                            if let code = json["status_code"] as? Int {
                                                expect(code).to(equal(statusCodeApi))
                                            }
                                        }
                                    } catch let error as NSError {
                                        print("Failed to load: \(error.localizedDescription)")
                                    }
                                } else {
                                    fail()
                                }
                                
                            }
                            
                            expectation.fulfill()
                        }).disposed(by: self.disposeBag)
                    
                    self.wait(for: [expectation], timeout: 0.1)
                }
            }
        }
    }
}

