//
//  NetworkManager.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import Foundation
import Moya
import RxSwift

enum NetworkEnvironment {
    case mock
    case development
    case production
}

class NetworkManager {
    
    var provider: MoyaProvider<MultiTarget>
    private static var selectedEnvironment: NetworkEnvironment = .development
    
    init (environment: NetworkEnvironment) {
        
        NetworkManager.selectedEnvironment = environment
        
        let plugins = RestClientHelper.getProviderPugins()
        
        switch environment {
        case .mock:
            provider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.immediatelyStub,
                                                 plugins: plugins)
        case .development,
             .production:
            provider = MoyaProvider<MultiTarget>(plugins: plugins)
        }
    }
    
    static func getApiEnvironment() -> NetworkEnvironment {
        return NetworkManager.selectedEnvironment
    }
    
    static func getBaseUrl() -> String {
        switch NetworkManager.getApiEnvironment() {
        case .production: return "https://api.themoviedb.org"
        case .development: return "https://api.themoviedb.org"
        default: return "https://api.themoviedb.org"
        }
    }
    
    static func getApiKeyMovieDB() -> String {
        switch NetworkManager.getApiEnvironment() {
        case .production: return "7d5e7b4c508fdb3424b5b8326ae875df"
        case .development: return "7d5e7b4c508fdb3424b5b8326ae875df"
        default: return "7d5e7b4c508fdb3424b5b8326ae875df"
        }
    }
    
    func makeRequest(_ target: TargetType) -> Single<Response> {
        return self.provider.rx.request(MultiTarget(target))
    }
}

// MARK: - Multitarget + AccessToken

extension MultiTarget: AccessTokenAuthorizable {
    public var authorizationType: AuthorizationType {
        if let targetAuth = target as? AccessTokenAuthorizable {
            return targetAuth.authorizationType
        }
        return .none
    }
}

// MARK: - Rest Client Helper

class RestClientHelper {
    
    static func getProviderPugins() -> [PluginType] {
        return [getLoggerPlugin()]
    }
    
    static func getLoggerPlugin() -> PluginType {
        // Slim plugin es mejor, hay que poner la lib
        return NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)
    }
    
    static func JSONResponseDataFormatter(_ data: Data) -> Data {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return prettyData
        } catch {
            return data // fallback to original data if it can't be serialized.
        }
    }
    
    // MARK: Params
    
    static func getParams(initials: [String: Any]? = nil) -> [String: Any] {
        var params: [String: Any] = [:]
        if initials != nil {
            initials!.forEach { (key, value) in params[key] = value }
        }
        return params
    }
    
    static func getMultipartBodyFrom(parameters: [String: Any]) -> [MultipartFormData] {
        var multiparts: [MultipartFormData] = []
        parameters.forEach { (key, value) in
            let multipart = MultipartFormData(provider: .data(String(describing: value).data(using: .utf8)!), name: key)
            multiparts.append(multipart)
        }
        
        return multiparts
    }
}
