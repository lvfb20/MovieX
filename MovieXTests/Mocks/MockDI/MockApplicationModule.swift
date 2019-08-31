//
//  MockApplication.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

@testable import MovieX
import Foundation
import Swinject
import SwinjectStoryboard

class MockDI {
    
    public static var defaultContainer = SwinjectStoryboard.defaultContainer
    public static var mockContainer = Container()
    
    static func mockDependencies() {
        MockDataModule().setup(mockContainer)
        MockViewModule().setup(mockContainer)
    }
    
}

