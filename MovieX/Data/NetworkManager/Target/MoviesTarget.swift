//
//  MoviesTarget.swift
//  MovieX
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//
import Moya

enum MoviesTarget {
    case popularMovies(request: BaseRequest)
}

extension MoviesTarget: TargetType {
    var apiKey: String {
        return NetworkManager.getApiKeyMovieDB()
    }
    
    var baseURL: URL {
        return URL(string: NetworkManager.getBaseUrl())!
    }
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/3/movie/popular"
        }
    }
    
    var method: Method {
        switch self {
        case .popularMovies:
            return .get
        }
    }
    
    var headers: [String: String]? {
        let header: [String: String] = ["Content-Type": "application/json"]
        return header
    }
    var task: Task {
        switch self {
        case .popularMovies:
            return .requestParameters(parameters: ["api_key": apiKey], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
}
