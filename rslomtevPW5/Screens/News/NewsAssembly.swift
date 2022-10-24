//
//  NewsAssembly.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 25.10.2022.
//

import UIKit

enum NewsAssembly {
    
    static func build(model: NewsModel.Article) -> UIViewController {
        let router = NewsRouter()
        let viewController = NewsViewController(router: router)
        
        viewController.configure(article: model)
        
        router.viewController = viewController
        
        return viewController
    }
}
