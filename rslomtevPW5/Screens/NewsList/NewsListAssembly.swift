//
//  NewsListAssembly.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 23.10.2022.
//

import UIKit

enum NewsListAssembly {
    
    static func build() -> UIViewController {
        let presenter = NewsListPresenter()
        let worker = NewsListWorker()
        let interactor = NewsListInteractor(presenter: presenter, worker: worker)
        let router = NewsListRouter()
        let viewController = NewsListViewController(interactor: interactor, router: router)
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
