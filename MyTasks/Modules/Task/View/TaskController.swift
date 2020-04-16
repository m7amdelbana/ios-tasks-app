//
//  TaskView.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit
import RxSwift

class TaskController: BaseController {
    
    @IBOutlet weak var sgPriority: UISegmentedControl!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var txtView: UITextView!
        
    var taskSubjectObservable: Observable<Task> {
        return presenter.taskSubject.asObservable()
    }
    
    var presenter: TaskPresenterInterface!
    var task: Task?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupDate()
    }

    private func setupView() {
        navigationItem.title = "add_task".localized()
        
        let btnSave = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveAction))
        btnSave.tintColor = .primary
        navigationItem.rightBarButtonItem = btnSave
        
        let btnShare = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAction))
        btnShare.tintColor = .primary
        navigationItem.leftBarButtonItem = btnShare
    }
    
    private func setupDate() {
        if let task = task {
            txtView.text = task.text
            lblDate.text = task.lastUpdate
            sgPriority.selectedSegmentIndex = task.priority.rawValue
        }
    }
    
    @objc func saveAction() {
        guard let text = txtView.text, !text.isEmpty else {
            presenter.showEmptyTaskAlert()
            return
        }
        save(with: text)
    }
    
    private func save(with text: String) {
        let priority = Priority(rawValue: sgPriority.selectedSegmentIndex)!
        let date = UTIL.getCurrentDate(in: .display)
        
        if task != nil {
            task?.update(text: text, priority: priority, lastUpdate: date)
            presenter.didClickedSave(task!)
        } else {
            let task = Task(text: text, priority: priority, lastUpdate: date)
            presenter.didClickedSave(task)
        }
    }
    
    @objc func shareAction() {
        guard let text = txtView.text, !text.isEmpty else { return }
        presenter.share(of: text)
    }
}
    
extension TaskController: TaskView {

}
