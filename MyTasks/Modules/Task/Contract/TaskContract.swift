//
//  TaskContract.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit
import RxSwift

protocol TaskView: class {
    var presenter: TaskPresenterInterface! { get set }
    
    var taskSubjectObservable: Observable<Task>  { get }
    var task: Task?  { get set }
}
    
protocol TaskPresenterInterface: class {
    var view: TaskView? { get set }
    var router: TaskRouterInterface! { get set }
    var interactor: TaskInteractorInterface! { get set }
    
    var taskSubject: PublishSubject<Task> { get set }
    
    func didClickedSave(_ task: Task)
    func showEmptyTaskAlert()
    func share(of text: String)
}
    
protocol TaskInteractorInterface: class {
    var output: TaskInteractorOutput? { get set }
}
    
protocol TaskInteractorOutput: class {
        
}
    
protocol TaskRouterInterface: class {
    var viewController: UIViewController? { get set }
    
    func popViewController()
    func presentEmptyTaskAlert()
    func share(of text: String)

    static func assembleModule(with task: Task?) -> UINavigationController
}
