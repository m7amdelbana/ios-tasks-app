//
//  TaskPresenter.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit
import RxSwift

class TaskPresenter: TaskPresenterInterface {

    weak var view: TaskView?
    var router: TaskRouterInterface!
    var interactor: TaskInteractorInterface!
    
    var taskSubject = PublishSubject<Task>()
    
    func didClickedSave(_ task: Task) {
        taskSubject.onNext(task)
        router.popViewController()
    }
    
    func showEmptyTaskAlert() {
        router.presentEmptyTaskAlert()
    }
    
    func share(of text: String) {
        router.share(of: text)
    }
}
    
extension TaskPresenter: TaskInteractorOutput {
        
}
