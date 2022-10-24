//
//  NewsRouter.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 25.10.2022.
//

import UIKit

class NewsRouter {
    
    weak var viewController: UIViewController?
}

extension NewsRouter: NewsRoutingLogic {
    
    func navigateBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
