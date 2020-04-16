//
//  MainContract.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol MainView: class {
    var presenter: MainPresenterInterface! { get set }
    
    var selectedPriority: Priority? { get }
    
    func updateUI()
    func showEmptyScreen()
    func hideEmptyScreen()
}
    
protocol MainPresenterInterface: class {
    var view: MainView? { get set }
    var router: MainRouterInterface! { get set }
    var interactor: MainInteractorInterface! { get set }
    
    var tasks: BehaviorRelay<[Task]> { get set }
    var disposeBag: DisposeBag  { get set }
    
    var filteredTasks: [Task] { get set }
    
    func viewDidLoad()
    
    func didClickedAddTask()
    func didClickedUpdateTask(at row: Int)
    func onTaskAddedOrUpdated(with task: Task)
    func presentTask(with task: Task?)
    func removeTask(at row: Int)
    
    func filterTasks()
}
    
protocol MainInteractorInterface: class {
    var output: MainInteractorOutput? { get set }
}
    
protocol MainInteractorOutput: class {
        
}
    
protocol MainRouterInterface: class {
    var viewController: UIViewController? { get set }
    
    func presentTask(with task: Task?, completion: @escaping (Observable<Task>) -> ())

    static func assembleModule() -> UIViewController
}
