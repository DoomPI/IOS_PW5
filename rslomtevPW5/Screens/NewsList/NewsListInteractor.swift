//
//  NewsInteractor.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 23.10.2022.
//

import Foundation

class NewsListInteractor {
    
    // MARK: Internal vars
    private let presenter: NewsListPresentationLogic
    private let worker: NewsListWorkerLogic
    
    init(presenter: NewsListPresentationLogic, worker: NewsListWorkerLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension NewsListInteractor: NewsListBusinessLogic {
    
    func fetchNews(_ request: Model.GetNews.Request) {
        worker.getNews(request) { [weak self] result in
            self?.presenter.present(Model.GetNews.Response(news: result))
        }
    }
}
