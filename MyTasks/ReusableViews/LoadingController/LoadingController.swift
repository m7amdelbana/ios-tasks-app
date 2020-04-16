//
//  LoadingController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class LoadingController: UIViewController {
    
    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorLoading.startAnimating()
    }
    
    func show(in view: UIView) {
        DispatchQueue.main.async {
            self.view.frame.size = view.frame.size
            self.view.alpha = 0
            view.addSubview(self.view)
            UIView.animate(withDuration: 0.2, animations: {
                self.view.alpha = 1
            })
        }
    }
    
    func close() {
        DispatchQueue.main.async {
            self.view.alpha = 1
            UIView.animate(withDuration: 0.2, animations: {
                self.view.alpha = 0
            }, completion: { _ in self.view.removeFromSuperview() })
        }
    }
}
