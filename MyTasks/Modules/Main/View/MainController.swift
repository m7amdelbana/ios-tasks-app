//
//  MainController.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit
import RxSwift

class MainController: BaseController {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var sgPriority: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainPresenterInterface!
    
    var selectedPriority: Priority? {
        return Priority(rawValue: sgPriority.selectedSegmentIndex - 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        navigationItem.title = "app_title".localized()
        let btnAdd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = btnAdd
    }
    
    @objc func addAction() {
        presenter.didClickedAddTask()
    }
    
    @IBAction func priorityChanged(_ sender: Any) {
        presenter.filterTasks()
    }
}

extension MainController: MainView {
    
    func showEmptyScreen() {
        presnetEmptyScreen(in: viewContainer)
    }
    
    func hideEmptyScreen() {
       closeEmptyScreen()
    }
}

