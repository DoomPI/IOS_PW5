//
//  WelcomeRouter.swift
//  rslomtevPW4
//
//  Created by Роман Ломтев on 09.10.2022.
//

import Foundation
import UIKit

protocol WelcomeRoutingLogic {
    
    func navigateToNotesScreen()
    func navigateToNewsListScreen()
}

class WelcomeRouter {
    
    weak var viewController: UIViewController?
}

extension WelcomeRouter: WelcomeRoutingLogic {
    
    func navigateToNotesScreen() {
        viewController?.navigationController?.pushViewController(NotesAssembly.build(),
                                                                 animated: true)
    }
    
    func navigateToNewsListScreen() {
        viewController?.navigationController?.pushViewController(NewsListAssembly.build(),
                                                                 animated: true)
    }
}
