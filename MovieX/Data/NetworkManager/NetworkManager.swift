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
        provider = MoyaProvider<MultiTarget>(stubClosure: environment == .mock ? MoyaProvider.immediatelyStub : MoyaProvider.neverStub,
                                             callbackQueue: DispatchQueue.main,
                                             plugins: [RestClientHelper.getLoggerPlugin()])
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

// MARK: - Rest Client Helper

class RestClientHelper {
    
     static func getLoggerPlugin() -> PluginType {
        return NetworkLoggerPlugin(configuration: .init(formatter: .init(requestData: jsonPrettyDataFormatter,
                                                                         responseData: jsonPrettyDataFormatter),
                                                        logOptions: [.formatRequestAscURL,
                                                                     .successResponseBody,
                                                                     .errorResponseBody]))
    }
    
    // Not in use for now.
    static func getAccessTokenPlugin(with accessToken: String) -> PluginType {
        return AccessTokenPlugin { (_) -> String in
            return accessToken
        }
    }
    
    static private func jsonPrettyDataFormatter(_ data: Data) -> String {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
        } catch {
            return String(data: data, encoding: .utf8) ?? ""
        }
    }
}
