//
//  TaskRouter.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class TaskRouter: TaskRouterInterface {

    weak var viewController: UIViewController?
    
    func popViewController() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    func presentEmptyTaskAlert() {
        ALERT.show(in: viewController, title: "empty".localized(), message: "empty_task_message".localized())
    }
    
    func share(of text: String) {
        UTIL.share(in: viewController, of: text)
    }
    
    static func assembleModule(with task: Task?) -> UINavigationController {
        let view: TaskController = UIStoryboard(name: "Task", bundle: nil).instantiateViewController(withIdentifier: "TaskController") as! TaskController
            
        let presenter = TaskPresenter()
        let interactor = TaskInteractor()
        let router = TaskRouter()
        
        view.task = task
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        let nav = UINavigationController(rootViewController: view)
        return nav
    }
}
