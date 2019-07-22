//
//  BaseContract.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

protocol BaseView: class {
    func showLoading()
    func hideLoading()
    func showNativeAlert(title: String, message: String?)
    func showPrettyAlert(title: String, message: String)
}

