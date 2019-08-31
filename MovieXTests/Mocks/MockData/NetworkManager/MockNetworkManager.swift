//
//  MockNetworkManager.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/30/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

@testable import MovieX
import RxSwift
import Moya

class MockNetworkManager: NetworkManager {
    
    init(){
        super.init(environment: .mock)
    }
    
    var targetToRequest: TargetType?
    var responseToMock: Response?  {
        didSet {
            let serverEndpointClosure = { (target: MultiTarget) -> Endpoint in
                return Endpoint(url: URL(target: target).absoluteString,
                                sampleResponseClosure: {.networkResponse(self.responseToMock!.statusCode, self.responseToMock!.data)} ,
                                method: target.method,
                                task: target.task,
                                httpHeaderFields: target.headers)
            }
            self.provider = MoyaProvider<MultiTarget>(endpointClosure: serverEndpointClosure,
                                                      stubClosure: MoyaProvider.immediatelyStub,
                                                      plugins: RestClientHelper.getProviderPugins())
            
        }
    }
    
    override func makeRequest(_ target: TargetType) -> Single<Response> {
        targetToRequest = target
        return self.provider.rx.request(MultiTarget(target))
    }
    
}
