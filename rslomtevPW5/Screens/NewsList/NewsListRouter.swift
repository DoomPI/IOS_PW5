//
//  NewsListRouter.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 25.10.2022.
//

import UIKit

class NewsListRouter {
    
    weak var viewController: UIViewController?
}

extension NewsListRouter: NewsListRoutingLogic {
    
    func navigateToNewsScreen(article: Model.Article) {
        let newsVC = NewsAssembly.build(model: article)
        viewController?.navigationController?.pushViewController(newsVC, animated: true)
    }
    
    func navigateBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
