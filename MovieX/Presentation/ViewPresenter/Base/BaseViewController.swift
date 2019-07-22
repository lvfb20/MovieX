//
//  BaseViewController.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

class BaseViewController<P: BasePresenter>: HelperBaseViewController {
    
    // -------------------------------------
    // MARK: Section - Vars
    // -------------------------------------
    
    typealias Presenter = P
    
    var presenter: Presenter!
    
    // -------------------------------------
    // MARK: Section - UIViewController
    // -------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.viewDidLoad()
    }
    
}
