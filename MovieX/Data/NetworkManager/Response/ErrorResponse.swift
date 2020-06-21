//
//  ErrorResponse.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

class ErrorResponse: Codable {
    var status: Int?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "status_message"
        case status = "status_code"
    }
}
