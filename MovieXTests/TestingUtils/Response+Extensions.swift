//
//  Response+Extensions.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Moya
import XCTest

extension Response {
    
    func checkRequestAndResponse(method: String, url: String, headers: [String: String] = [:], status: Int) {
        self.checkRequest(method: method, url: url, headers: headers)
        self.checkResponse(status: status)
    }
    
    func checkRequest(method: String, url: String, headers: [String: String] = [:]) {
        XCTAssertEqual(self.request!.url!.absoluteString, url)
        XCTAssertEqual(self.request!.httpMethod!, method)
        
        for header in headers {
            let realHeader = self.request?.allHTTPHeaderFields?[header.key] ?? "missing_\(header.key)"
            XCTAssertEqual(realHeader, header.value)
        }
    }
    
    func checkResponse(status: Int) {
        XCTAssertEqual(self.statusCode, status)
    }
}
