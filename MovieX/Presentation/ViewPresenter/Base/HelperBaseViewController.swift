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
    
    // -------------------------------------
    // MARK: Section - Vars
    // -------------------------------------
    
    var wireframe: Wireframe!
    
    var singleFingerTap: UITapGestureRecognizer?
    
    // -------------------------------------
    // MARK: Section - UIViewController
    // -------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestureNotification()
        stopGestureRecognizerFromBaseView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addBaseKeyboardWillShowNotification()
        addBaseKeyboardWillHideNotification()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        removeBaseNotification()
    }
    
    // -------------------------------------
    // MARK: Section - Public methods
    // -------------------------------------
    
    func stopGestureRecognizerFromBaseView() {
        self.singleFingerTap?.cancelsTouchesInView = false
    }
    
    func restartGestureRecognizerFromBaseView() {
        self.singleFingerTap?.cancelsTouchesInView = true
    }
    
    // Estos metodos son mas que todo para que se extiendan
    internal func baseViewTapGesture(_ recognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
        NSLog("View tap in base")
    }
    
    internal func baseViewKeyboardWillShow(notification: Notification, userInfo: [AnyHashable: Any], keyboardRect: CGRect) {
        NSLog("Keyboard show in base")
    }
    
    internal func baseViewKeyboardWillHide(notification: Notification, userInfo: [AnyHashable: Any], keyboardRect: CGRect) {
        NSLog("Keyboard hide in base")
    }
    
    // -------------------------------------
    // MARK: Section - Private Methods
    // -------------------------------------
    
    private func addTapGestureNotification() {
        let selector         = #selector(HelperBaseViewController.handleBaseSingleTapNotification(_:))
        self.singleFingerTap = UITapGestureRecognizer(target: self, action: selector)
        self.view.addGestureRecognizer(self.singleFingerTap!)
    }
    
    private func addBaseKeyboardWillShowNotification() {
        let sel = #selector(handleBaseKeyboardWillShowNotification(_:))
        NotificationCenter.default
            .addObserver(self, selector: sel, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    private func addBaseKeyboardWillHideNotification() {
        let sel = #selector(handleBaseKeyboardWillHideNotification(_:))
        NotificationCenter.default
            .addObserver(self, selector: sel, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeBaseNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func handleBaseSingleTapNotification(_ taprecognizer: UITapGestureRecognizer) {
        baseViewTapGesture(taprecognizer)
    }
    
    @objc func handleBaseKeyboardWillShowNotification(_ notifcation: Notification) {
        let userInfo: Dictionary = notifcation.userInfo!
        let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        baseViewKeyboardWillShow(notification: notifcation, userInfo: userInfo, keyboardRect: keyboardFrame!)
    }
    
    @objc func handleBaseKeyboardWillHideNotification(_ notifcation: Notification) {
        let userInfo: Dictionary = notifcation.userInfo!
        let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        baseViewKeyboardWillHide(notification: notifcation, userInfo: userInfo, keyboardRect: keyboardFrame!)
    }
    
    // -------------------------------------
    // MARK: Section - BaseView Protocol
    // -------------------------------------
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
    
    func showNativeAlert(title: String, message: String? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        //alert.addAction(UIAlertAction(title: "base_view_ok".locale(), style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "base_view_ok", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showPrettyAlert(title: String, message: String) {
        showGenericMessagePopup(title: title, message: message)
    }
    
    func showGenericMessagePopup(title: String,
                                 message: String,
                                 buttonOk: String? = nil,
                                 buttonCancel: String? = nil,
                                 completionOk: (() -> Swift.Void)? = nil,
                                 completionCancel: (() -> Swift.Void)? = nil) {
        let popup = CustomAlertViewController()
        popup.modalPresentationStyle = .overFullScreen
        popup.setInformation(title: title,
                             message: message,
                             buttonOk: buttonOk,
                             buttonCancel: buttonCancel,
                             completionOk: completionOk,
                             completionCancel: completionCancel)
        self.present(popup, animated: true, completion: nil)
    }
}

