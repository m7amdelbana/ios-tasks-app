//
//  MainRouter.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit
import RxSwift

class MainRouter: MainRouterInterface {
    
    weak var viewController: UIViewController?
    
    func presentTask(with task: Task?, completion: @escaping (Observable<Task>) -> ()) {
        let nav = TaskRouter.assembleModule(with: task)
        let view = nav.viewControllers.first as! TaskController
        viewController?.present(nav, animated: true, completion: {
            completion(view.taskSubjectObservable)
        })
    }
    
    static func assembleModule() -> UIViewController {
        let view: MainController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainController") as! MainController
            
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let router = MainRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        let nav = NavController(rootViewController: view)
        return nav
    }
}
