//
//  HelperBaseViewController.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit
import PKHUD

class HelperBaseViewController: UIViewController, BaseView {
    
    // MARK: Section - Vars

    internal var tapGestureRecognizer: UITapGestureRecognizer!
    
    internal var needNavigationBar = false

    private var navLeftAction: (() -> Void)?
    private var navRightAction: (() -> Void)?

    // MARK: Section - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addKeyboardNotifications()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeKeyboardNotifications()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: Section - Public methods

    internal func setupView() {
        // Since there is no xib o storyboards, a basic background color is needed to avoid clear.
        view.backgroundColor = .white
        addTapGestureNotification()
    }
    
    func stopGestureRecognizerFromBaseView() {
        self.tapGestureRecognizer?.cancelsTouchesInView = false
    }
    
    func restartGestureRecognizerFromBaseView() {
        self.tapGestureRecognizer?.cancelsTouchesInView = true
    }
    
    // MARK: Section - Private Methods
 
    private func addTapGestureNotification() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                         selector: #selector(handleBaseKeyboardWillShowNotification(_:)),
                         name: UIResponder.keyboardWillShowNotification,
                         object: nil)
        NotificationCenter.default.addObserver(self,
                         selector: #selector(handleBaseKeyboardWillHideNotification(_:)),
                         name: UIResponder.keyboardWillHideNotification,
                         object: nil)
    }
    
    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
   // MARK: Keyboard Handlers

    @objc private  func handleBaseKeyboardWillShowNotification(_ notification: Notification) {
        let userInfo: Dictionary = notification.userInfo!
        let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        keyboardWillShow(notification: notification, userInfo: userInfo, keyboardRect: keyboardFrame!)
    }
    
    internal func keyboardWillShow(notification: Notification, userInfo: [AnyHashable: Any], keyboardRect: CGRect) {
        NSLog("Keyboard show in base")
    }
    
    @objc private func handleBaseKeyboardWillHideNotification(_ notification: Notification) {
        let userInfo: Dictionary = notification.userInfo!
        let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        keyboardWillHide(notification: notification, userInfo: userInfo, keyboardRect: keyboardFrame!)
    }
    
    internal func keyboardWillHide(notification: Notification, userInfo: [AnyHashable: Any], keyboardRect: CGRect) {
        NSLog("Keyboard hide in base")
    }
    
   // MARK: Section - BaseView Protocol
 
    func showNativeAlert(title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Generic.Ok".localized.capitalized, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showError<E>(_ error: E) where E: Swift.Error {
        let title = "Error.Title".localized
        switch error as? MovieXError {
        case .general, .noSession, .noConnection, .unauthorized,
             .serverException, .notFound, .unknown, .parsing:
            showNativeAlert(title: title, message: error.localizedDescription)
        case .api:
            //Don't show the api errors to users because are not correctly formated
            #if DEBUG
                showNativeAlert(title: title, message: error.localizedDescription)
            #else
                showNativeAlert(title: title, message: "Error.Message".localized)
                print(error.localizedDescription)
            #endif
        case .doNothing: break
        default:
            showNativeAlert(title: title, message: "Error.Message".localized)
            print(error.localizedDescription)
        }
    }
    
    // MARK: Section - Loadable

    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    func showSuccess(completion: ((Bool) -> Void)? = nil) {
        HUD.flash(.success, delay: 0.7, completion: completion)
    }
}

extension HelperBaseViewController {
    func setNavButton(left: Bool, text: String? = nil, image: UIImage? = nil, action: (() -> Void)? = nil ) {
        let myButton = UIButton.init(type: .custom)
        
        if let text = text {
            myButton.setTitleColor(UIColor.lightGray, for: .normal)
            myButton.setTitle(text, for: .normal)
        } else if let image = image {
            myButton.setImage(image, for: .normal)
            myButton.sizeToFit()
            myButton.frame.size.width *= 3
            myButton.frame.size.height *= 1.5
        }
        
        myButton.contentHorizontalAlignment = left ? .left : .right
        myButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 0 )
        
        if left {
            navLeftAction = action
            myButton.addTarget(self, action: #selector(self.leftButtonClicked(sender:)), for: .touchUpInside)
            self.navigationItem.leftBarButtonItem  = UIBarButtonItem(customView: myButton)
        } else {
            navRightAction = action
            myButton.addTarget(self, action: #selector(self.rightButtonClicked(sender:)), for: .touchUpInside)
            self.navigationItem.rightBarButtonItem  = UIBarButtonItem(customView: myButton)
        }
    }
    
    func setBackButton() {
        setNavButton(left: true, image: Style.Image.named(.back))
    }
    
    @objc func leftButtonClicked(sender: UIBarButtonItem) {
        if let block = navLeftAction {
            block()
        } else {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func rightButtonClicked(sender: UIBarButtonItem) {
        if let block = navRightAction {
            block()
        }
    }
}
