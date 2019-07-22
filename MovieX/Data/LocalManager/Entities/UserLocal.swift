//
//  UserLocal.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

struct UserLocal: Codable {
    var loginToken: String?
    var userId: Int?
    var email: String?
    var name: String?
    var lastname: String?
    var birthdate: String?
    var pictureToken: String?
}
