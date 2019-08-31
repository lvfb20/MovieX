//
//  Testing+Extensions.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func preloadViewForTest() {
        _ = view
    }
    
}

extension String {
    func concatWithPath(paht: String) -> String {
        return self + "/\(paht)"
    }
}
