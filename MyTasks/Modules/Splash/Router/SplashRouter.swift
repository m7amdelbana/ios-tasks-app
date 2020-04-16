
//
//  SplashRouter.swift
//  vnjf
//
//  Created by Mohamed Elbana on 4/1/2020.
//  Copyright © 2020 vjbdbv. All rights reserved.
//

import UIKit

class SplashRouter: SplashRouterInterface {

    weak var viewController: UIViewController?
    
    func presentHome() {
        let vc = MainRouter.assembleModule()
        RootRouter.presentRootScreen(in: SCENE?.window, vc: vc)
    }

    static func assembleModule() -> UIViewController {
        let view: SplashController = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "SplashController") as! SplashController
            
        let presenter = SplashPresenter()
        let interactor = SplashInteractor()
        let router = SplashRouter()
            
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        return view
    }
}
