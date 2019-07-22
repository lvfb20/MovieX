//
//  BaseCustomView.swift
//  MovieX
//
//  Created by Legna Filloy on 7/18/19.
//  Copyright © 2019 legnafilloy. All rights reserved.
//

import UIKit

class BaseCustomView: UIView {
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        _ = self.subviews.map { $0.removeFromSuperview()}
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        backgroundColor = .lightGray
        let label = UILabel(frame: self.bounds)
        label.adjustsFontSizeToFitWidth = true
        label.text = String(describing: type(of: self))
        addSubview(label)
    }
    
}

