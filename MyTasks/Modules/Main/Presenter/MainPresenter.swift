//
//  MainPresenter.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainPresenter: MainPresenterInterface {

    weak var view: MainView?
    var router: MainRouterInterface!
    var interactor: MainInteractorInterface!
    
    var tasks = BehaviorRelay<[Task]>(value: [])
    var disposeBag = DisposeBag()
    
    var filteredTasks = [Task]([])
    
    func viewDidLoad() {
        self.tasks.subscribe(onNext: { [ weak self ] tasks in
            guard let self = self else { return }
            self.filterTasks()
        }).disposed(by: disposeBag)
        
        tasks.accept(TASK.retrieve())
    }
    
    func filterTasks() {
        defer { view?.updateUI() }
        
        guard let priority = view?.selectedPriority else {
            filteredTasks = tasks.value
            return
        }
        
        filteredTasks = tasks.value.filter {
            return $0.priority == priority
        }
    }
    
    func didClickedAddTask() {
        presentTask()
    }
    
    func didClickedUpdateTask(at row: Int) {
        presentTask(with: filteredTasks[row])
    }
    
    func presentTask(with task: Task? = nil) {
        router.presentTask(with: task) { observable in
            observable.subscribe(onNext: { [ unowned self ] task in
                self.onTaskAddedOrUpdated(with: task)
            }).disposed(by: self.disposeBag)
        }
    }
    
    func onTaskAddedOrUpdated(with task: Task) {
        var existingsTasks = tasks.value
        if let row = existingsTasks.firstIndex(where: { $0.id == task.id }) {
            existingsTasks.remove(at: row)
        }
        existingsTasks.insert(task, at: 0)
        tasks.accept(existingsTasks)
        
        TASK.storeOrUpdate(task: task)
    }
    
    func removeTask(at row: Int) {
        let task = filteredTasks[row]
        var existingsTasks = tasks.value
        existingsTasks.removeAll { $0.id == task.id }
        tasks.accept(existingsTasks)
        
        TASK.delete(taskId: task.id)
    }
}
    
extension MainPresenter: MainInteractorOutput {
        
}
