//
//  BaseViewController.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

protocol BaseView: AnyObject, Loadable {
    func showError<E>(_ error: E) where E: Swift.Error
    func showNativeAlert(title: String, message: String?)
    func showSuccess(completion: ((Bool) -> Void)?)
}

protocol Loadable {
    func showLoading()
    func hideLoading()
}

class BaseViewController<P: BasePresenter>: HelperBaseViewController {
    
    // MARK: Section - Vars

    typealias Presenter = P
    
    var presenter: Presenter!
    
    // MARK: Section - UIViewController

    override func loadView() {
        super.loadView()
        presenter.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.viewDidDisappear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear()
    }

}
