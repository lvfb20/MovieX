//
//  CustomAlertViewController.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit
import SnapKit

class CustomAlertViewController: UIViewController {
    
    // -------------------------------------
    // MARK: Section - Outlets
    // -------------------------------------
    
    // -------------------------------------
    // MARK: Section - Public Vars
    // -------------------------------------
    
    var screenTitle: String = ""
    var screenMessage: String = ""
    var screenButtonOk: String = "ok"
    var screenButtonCancel: String = "cancel"
    var completionOk: (() -> Swift.Void)?
    var completionCancel: (() -> Swift.Void)?
    
    // -------------------------------------
    // MARK: Section - Private Vars
    // -------------------------------------
    
    private var boxView: UIView!
    private var titleLabel: UILabel!
    private var messageLabel: UILabel!
    private var okButton: UIButton!
    private var cancelButton: UIButton!
    
    // -------------------------------------
    // MARK: Section - UIViewController
    // -------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.65)
        
        createBox()
        createTitle()
        createMessage()
        createButtonOk()
        
        titleLabel.text = screenTitle
        messageLabel.text = screenMessage
        okButton.setTitle(screenButtonOk, for: .normal)
    }
    
    private func createBox() {
        boxView = UIView(frame: .zero)
        boxView.backgroundColor = .white
        boxView.layer.cornerRadius = 10
        
        view.addSubview(boxView)
        
        boxView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.centerY.equalToSuperview()
            make.height.equalTo(boxView.snp.width)
        }
    }
    
    private func createTitle() {
        titleLabel = UILabel(frame: .zero)
//        titleLabel.font = UIFont.fontSemiBold(size: 18)
//        titleLabel.textColor = UIColor.gunmetal
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        boxView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalToSuperview().offset(35)
            make.height.equalTo(30)
        }
    }
    
    private func createMessage() {
        messageLabel = UILabel(frame: .zero)
//        messageLabel.font = UIFont.fontMedium(size: 16)
//        messageLabel.textColor = UIColor.gunmetal
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        boxView.addSubview(messageLabel)
        
        messageLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
    }
    
    private func createButtonOk() {
        okButton = UIButton(frame: .zero)
        okButton.addTarget(self, action: #selector(CustomAlertViewController.okButtonClicked), for: .touchUpInside)
        boxView.addSubview(okButton)
        okButton.snp.makeConstraints { (make) in
            make.width.equalTo(160)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-27)
            make.centerX.equalToSuperview()
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            // la ultima linea sirve para darle tamano al texto del label del mensaje
        }
        okButton.layoutIfNeeded()
//        okButton.roundedBlueButton()
    }
    
    private func createButtonCancel() {
        
    }
    
    // -------------------------------------
    // MARK: Section - Public Methods
    // -------------------------------------
    
    func setInformation(title: String,
                        message: String,
                        buttonOk: String? = nil,
                        buttonCancel: String? = nil,
                        completionOk: (() -> Swift.Void)? = nil,
                        completionCancel: (() -> Swift.Void)? = nil) {
        self.screenTitle = title
        self.screenMessage = message
        if let buttonOk = buttonOk {
            self.screenButtonOk = buttonOk
        }
        if let buttonCancel = buttonCancel {
            self.screenButtonCancel = buttonCancel
        }
        self.completionOk = completionOk
        self.completionCancel = completionCancel
    }
    
    // -------------------------------------
    // MARK: Section - Actions
    // -------------------------------------
    
    @objc func okButtonClicked() {
        self.dismiss(animated: false, completion: self.completionOk)
    }
    
    // -------------------------------------
    // MARK: Section - Private Methods
    // -------------------------------------
    
}

