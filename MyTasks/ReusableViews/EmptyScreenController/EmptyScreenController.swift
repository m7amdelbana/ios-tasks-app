//
//  EmptyScreenController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class EmptyScreenController: UIViewController {
    
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblMessage.text = "no_tasks_message".localized()
    }
    
    func show(in view: UIView) {
        DispatchQueue.main.async {
            self.view.frame.size = view.bounds.size
            view.addSubview(self.view)
        }
    }
    
    func close() {
        DispatchQueue.main.async {
            self.view.removeFromSuperview()
        }
    }
}
