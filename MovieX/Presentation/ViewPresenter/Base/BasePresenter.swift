//
//  BasePresenter.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import RxSwift
import Moya

class BasePresenter {
    internal weak var baseView: BaseView?
    internal let disposeBag: DisposeBag
    internal let wireframe: Wireframe
    
    init(wireframe: Wireframe) {
        self.wireframe = wireframe
        self.disposeBag = DisposeBag()
    }
    
    func loadView() {}
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewDidDisappear() {}
    func viewWillDisappear() {}

    func attachView<T: BaseView>(view: T) {
        self.baseView = view
    }

    func handle(movieXError: MovieXError) {
        switch movieXError {
        case .noSession, .unauthorized:
            //Do something
            break
        default:
            baseView?.showError(movieXError)
        }
    }
}
