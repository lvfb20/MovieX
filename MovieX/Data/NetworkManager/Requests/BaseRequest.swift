//
//  BaseRequest.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

class BaseRequest {
    // All necessary info for each request
    var deviceModel: String?
    var deviceOS: String?
    var deviceVersion: String?
    var deviceId: String?
    var loginToken: String?
    
    init() {}
}

