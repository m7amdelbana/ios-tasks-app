//
//  NavController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class NavController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
    }
    
    private func setupview() {
        navigationBar.tintColor = .primary
        navigationBar.prefersLargeTitles = true
    }
}
