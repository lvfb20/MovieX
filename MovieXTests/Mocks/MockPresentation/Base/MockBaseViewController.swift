//
//  MockBaseViewController.swift
//  MovieXTests
//
//  Created by Legna Filloy on 8/31/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

@testable import MovieX

class MockBaseViewController<P: BasePresenter>: HelperBaseViewController {
    
    // MARK: TESTING VARS

    var fc_showLoading = false
    var fc_hideLoading = false
    
    var fc_showNativeAlert = false
    var dr_showNativeAlert_title: String? = nil
    var dr_showNativeAlert_message: String? = nil
   
    // MARK: Section - Vars

    typealias Presenter = P
    var presenter: Presenter!
    
    // MARK: Section - UIViewController
 
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.viewDidLoad()
    }
    
    // MARK: Section - Base View

    override func showLoading() {
        fc_showLoading = true
    }
    
    override func hideLoading() {
        fc_hideLoading = true
    }
    
    // MARK: Section - Public methods

    override func showNativeAlert(title: String, message: String? = nil) {
        fc_showNativeAlert = true
        dr_showNativeAlert_title = title
        dr_showNativeAlert_message = message
    }

}

