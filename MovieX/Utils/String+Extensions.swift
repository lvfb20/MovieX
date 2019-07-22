//
//  String+Extensions.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
import UIKit

extension String {

    func locale() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func locale(withComment comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    func locale(inTableName tableName: String, withComment comment: String) -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, value: "", comment: comment)
    }
    
}
