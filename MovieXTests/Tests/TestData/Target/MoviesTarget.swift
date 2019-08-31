//
//  MoviesTarget.swift
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

class MoviesTargetSpec: QuickSpec {
    
    var disposeBag: DisposeBag!
    let baseUrl = "https://api.themoviedb.org"
    var mockNetworkManager: MockNetworkManager!
    
    override func spec() {
        MockDI.mockDependencies()
        disposeBag = DisposeBag()
        
        mockNetworkManager = (MockDI.mockContainer.resolve(NetworkManager.self) as! MockNetworkManager)
        
        describe("MovieTarget") {
            context("When popularMovies is called") {
                it("should match request and response") {
                    let data = TestingUtils.parseJsonFileToData(filename: "popularMoviesSuccess")!
                    self.mockNetworkManager.responseToMock = Response(statusCode: 200, data: data)
                    
                    let request = BaseRequest()
                    
                    let expectation = self.expectation(description: "wait for popularMovies from mock api to complete")
                    self.mockNetworkManager.makeRequest(MoviesTarget.popularMovies(request: request))
                        .subscribe(onSuccess: { (response) in
                            response.checkRequestAndResponse(method: "GET",
                                                             url: self.baseUrl.concatWithPath(paht: "3/movie/popular?api_key=7d5e7b4c508fdb3424b5b8326ae875df"),
                                                             headers: ["Content-Type": "application/json"],
                                                             status: 200)
                            
                            expectation.fulfill()
                        }, onError: nil).disposed(by: self.disposeBag)
                    
                    self.wait(for: [expectation], timeout: 0.1)
                }
            }
        }
    }
}

