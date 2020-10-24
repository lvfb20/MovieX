//
//  TestingUtils.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

@testable import MovieX
import Foundation
import RxSwift

class TestingUtils {
    
    static func parseJsonFileToData(filename: String) -> Data! {
        @objc class TestClass: NSObject {}
        
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
    
    static func parseJsonFileToString(filename: String) -> String {
        @objc class TestClass: NSObject {}
        
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        let data = (try? Data(contentsOf: URL(fileURLWithPath: path!)))
        return String(data: data!, encoding: .utf8)!
    }
    
    static func returnGeneralErrorIfDataIsNil<P>(data: P?) -> Single<P> {
        if data == nil {
            return Single.error(MovieXError.general)
        }
        return Single.just(data!)
    }
    
    static func returnGeneralErrorIfDataIsNil<P>(data: P?, error: Error?) -> Single<P> {
        
        if let errorNotNil = error {
            return Single.error(errorNotNil)
        }
        
        if data == nil {
            return Single.error(MovieXError.general)
        }
        return Single.just(data!)
    }
}
