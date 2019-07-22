//
//  LoginPresenter.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

class LoginPresenter: BasePresenter {
    
    internal var view: LoginView? {
        return baseView as? LoginView
    }
    
    private var userIteractor: UserInteractorProtocol
    
    init(userIteractor: UserInteractorProtocol) {
        self.userIteractor = userIteractor
    }
    
    override func viewDidLoad() {        
    }
}
