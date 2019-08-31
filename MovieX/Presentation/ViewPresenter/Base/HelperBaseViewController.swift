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
    private var navLeftAction: (() -> Void)?
    private var navRightAction: (() -> Void)?
    
    // -------------------------------------
    // MARK: Section - UIViewController
    // -------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDefaultNavBarStyles()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
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

extension HelperBaseViewController {
    
    func setDefaultNavBarStyles() {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = false
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                              NSAttributedString.Key.font: UIFont.init(name: "GillSans", size: 18)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func transparentNavStyles() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setNavButton(text: String?, image: UIImage?, left: Bool) {
        let myButton = UIButton.init(type: .custom)
        
        if left {
            myButton.addTarget(self, action: #selector(self.leftButtonClicked(sender:)), for: .touchUpInside)
        } else {
            myButton.addTarget(self, action: #selector(self.rightButtonClicked(sender:)), for: .touchUpInside)
        }
        
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
            self.navigationItem.leftBarButtonItem  = UIBarButtonItem(customView: myButton)
        } else {
            self.navigationItem.rightBarButtonItem  = UIBarButtonItem(customView: myButton)
        }
        
    }
    
    func changeNavLeftButton(image: UIImage?) {
        setNavButton(text: nil, image: image, left: true)
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

