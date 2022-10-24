//
//  NewsPresenter.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 23.10.2022.
//

import Foundation

class NewsListPresenter {
    
    // MARK: - External vars
    weak var viewController: NewsListDisplayLogic?
}

extension NewsListPresenter: NewsListPresentationLogic {
    
    func present(_ response: Model.GetNews.Response) {
        viewController?.display(data: Model.GetNews.ViewModel(news: response.news))
    }
}
