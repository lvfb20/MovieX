//
//  Data+Extensions.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

extension Data {
    
    func httpBodyToDict() -> [String: Any]{
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: self)
            guard let jsonInDict = dataAsJSON as? [String: Any] else {
                return [:]
            }
            return jsonInDict
        } catch {
            return [:]
        }
    }
    
    func httpBodyToString() -> String {
        guard let string = String(data: self, encoding: .utf8) else {
            return ""
        }
        return string
    }
}
