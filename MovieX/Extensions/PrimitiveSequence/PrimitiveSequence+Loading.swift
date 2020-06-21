//
//  Prrr.swift
//  MovieX
//
//  Created by Legna Filloy on 6/20/20.
//  Copyright © 2020 legnafilloy. All rights reserved.
//

import RxSwift

// MARK: - Single extension
extension PrimitiveSequence where Trait == SingleTrait {
    func loading(view: Loadable?) -> Single<Element> {
        view?.showLoading()
        return self.observeOn(MainScheduler.asyncInstance).do(onSuccess: { _ in
            view?.hideLoading()
        }, onError: { _ in
            view?.hideLoading()
        })
    }
}

// MARK: - Completable extension
extension PrimitiveSequence where Trait == CompletableTrait, Element == Never {
    func loading(view: Loadable?) -> Completable {
        view?.showLoading()
        return self.observeOn(MainScheduler.asyncInstance).do(onError: { _ in
            view?.hideLoading()
        }, onCompleted: {
            view?.hideLoading()
        })
    }
}
