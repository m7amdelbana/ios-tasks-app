//
//  SplashPresenter.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class SplashPresenter: SplashPresenterInterface {

    weak var view: SplashView?
    var router: SplashRouterInterface!
    var interactor: SplashInteractorInterface!
    
    func viewWillAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.router.presentHome()
        }
    }
}
    
extension SplashPresenter: SplashInteractorOutput {
        
}
