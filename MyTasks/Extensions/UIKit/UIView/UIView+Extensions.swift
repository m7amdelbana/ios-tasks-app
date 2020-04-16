//
//  UIView+Extensions.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            if newValue >= 0 {
                layer.cornerRadius = newValue
                clipsToBounds = newValue > 0
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set {
            if newValue >= 0 {
                layer.borderWidth = newValue
            }
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            if let cgColor = layer.borderColor {
                return UIColor(cgColor: cgColor)
            } else {
                return .clear
            }
        }
        set { layer.borderColor = newValue.cgColor }
    }
}
