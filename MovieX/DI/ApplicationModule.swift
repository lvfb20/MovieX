//
//  ApplicationModule.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        DataModule().setup(defaultContainer)
        ViewModule().setup(defaultContainer)
    }
}
