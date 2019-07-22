//
//  UserTarget.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Moya

enum UserTarget {
    case login(request: LoginRequest)
    case getInfo(request: BaseRequest)
}

extension UserTarget: TargetType {

    var baseURL: URL {
        return URL(string: NetworkManager.getBaseUrlForAsApi())!
    }

    var path: String {
        switch self {
        case .login:
            return "api/user/login"
        case .getInfo:
            return "api/user"
        }
    }

    var method: Method {
        switch self {
        case .login:
            return .post
        case .getInfo:
            return .get
        }
    }

    var headers: [String: String]? {
        var header: [String: String] = [
            "Content-Type": "application/json",
        ]

        switch self {
        case .getInfo(let request):
            if let token = request.loginToken {
                header["login-token"] = token
            }
        default:
            break
        }

        return header
    }

    var task: Task {

        switch self {
        case .login(let loginRequest):

            var params: [String: Any] = [:]
            params["email"] = loginRequest.email ?? ""
            params["password"] = loginRequest.password ?? ""
            params["deviceModel"] = loginRequest.deviceModel ?? ""
            params["deviceOS"] = loginRequest.deviceOS ?? ""
            params["deviceVersion"] = loginRequest.deviceVersion ?? ""
            params["deviceId"] = loginRequest.deviceId ?? ""

            return .requestParameters(parameters: params, encoding: JSONEncoding.default)

        default:
            return .requestPlain
        }
    }

    var sampleData: Data {
        return "".data(using: .utf8)!
    }

}
