//
//  ExampleModel.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation

class UserModel {

    var loginToken: String?
    var userId: Int?
    var email: String?
    var name: String?
    var lastName: String?

}

extension UserModel {
    func parseToLocal() -> UserLocal {
        var local = UserLocal()
        local.loginToken = self.loginToken
        local.userId = self.userId
        local.email = self.email
        local.name = self.name
        local.lastname = self.lastName
        return local
    }
}

extension UserEntity {
    func parseToModel() -> UserModel {
        let model = UserModel()
        model.loginToken = self.loginToken
        model.userId = self.userId
        model.email = self.email
        model.name = self.name
        model.lastName = self.lastName
        return model
    }
}

extension UserLocal {

    func parseToModel() -> UserModel {
        let model = UserModel()
        model.loginToken = self.loginToken
        model.userId = self.userId
        model.email = self.email
        model.name = self.name
        model.lastName = self.lastname
        return model
    }
}

