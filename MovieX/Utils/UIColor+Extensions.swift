//
//  UIColor+Extensions.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit

extension UIColor {

    @nonobjc class var lightGreyBlue: UIColor {
        return UIColor(red: 172.0 / 255.0, green: 179.0 / 255.0, blue: 183.0 / 255.0, alpha: 1.0)
    }
    
}

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var transparent: UIColor {
        return UIColor(white: 1, alpha: 0.0)
    }
    
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}

