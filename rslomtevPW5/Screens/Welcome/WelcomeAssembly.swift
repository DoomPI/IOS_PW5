//
//  WelcomeAssembly.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 23.10.2022.
//

import UIKit

enum WelcomeAssembly {
    
    static func build() -> UIViewController {
        let router = WelcomeRouter()
        let viewController = WelcomeViewController(router: router)
        
        router.viewController = viewController
        
        return viewController
    }
}
