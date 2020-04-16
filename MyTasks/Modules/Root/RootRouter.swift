//
//  RootRouter.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

class RootRouter {
    
    static func presentRootScreen(in window: UIWindow?, vc: UIViewController) {
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    static func resetApp() {
        let vc = SplashRouter.assembleModule()
        presentRootScreen(in: SCENE?.window, vc: vc)
    }
}
