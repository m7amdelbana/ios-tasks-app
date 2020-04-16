//
//  SplashContract.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

protocol SplashView: class {
    var presenter: SplashPresenterInterface! { get set }
}
    
protocol SplashPresenterInterface: class {
    var view: SplashView? { get set }
    var router: SplashRouterInterface! { get set }
    var interactor: SplashInteractorInterface! { get set }
    
    func viewWillAppear()
}
    
protocol SplashInteractorInterface: class {
    var output: SplashInteractorOutput? { get set }
}
    
protocol SplashInteractorOutput: class {
        
}
    
protocol SplashRouterInterface: class {
    var viewController: UIViewController? { get set }
    
    func presentHome()

    static func assembleModule() -> UIViewController
}
