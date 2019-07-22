//
//  LoginViewController.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit
import SnapKit

protocol LoginView: BaseView {
    func goToHome()
}

class LoginViewController: BaseViewController<LoginPresenter> {
    
    // -------------------------------------
    // MARK: Section - Outlets
    // -------------------------------------
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
   
    // -------------------------------------
    // MARK: Section - Public Vars
    // -------------------------------------
    
    // -------------------------------------
    // MARK: Section - Private Vars
    // -------------------------------------
    
    // -------------------------------------
    // MARK: Section - UIViewController
    // -------------------------------------
    
    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: LoginViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNavigationBar()
        setupView()
    }
    
    private func setupView() {
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        loginButton.setTitle("Login.Button.login".locale(), for: .normal)
    }
    
    // -------------------------------------
    // MARK: Section - Public Methods
    // -------------------------------------
    
    func isDataValid(email: String, password: String) -> Bool {
        return email.isValidMail() && password.isValidPassword()
    }
    
    // -------------------------------------
    // MARK: Section - Actions
    // -------------------------------------
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        if self.isDataValid(email: email, password: password) {
        }
    }
    
    // -------------------------------------
    // MARK: Section - Private Methods
    // -------------------------------------
    
}

extension LoginViewController: LoginView {
    func goToHome() {
        Wireframe.presentTabsNavigationScreen()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        return false
    }
    
}
