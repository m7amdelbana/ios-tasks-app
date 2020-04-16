//
//  AlertController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

let ALERT = AlertController.shared

class AlertController: UIViewController {
    
    static let shared = AlertController()
    
    var alert: UIAlertController = UIAlertController()
    
    func show(in vc: UIViewController?, title: String? = "error_title".localized(), message: String? = "error_message".localized(), btnTitle: String? = "ok".localized()) {
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default))
        vc?.present(alert, animated: true, completion: nil)
    }
}
