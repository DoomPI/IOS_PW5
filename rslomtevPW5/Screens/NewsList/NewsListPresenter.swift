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
        var articles = [Model.Article]()
        guard let networkArticles = response.news.articles else {
            return
        }
        for article in networkArticles {
            articles.append(Model.Article(
                title: article.title,
                description: article.description,
                imageURL: article.imageURL
            ))
        }
        let news = Model.News(articles: articles)
        
        viewController?.display(data: Model.GetNews.ViewModel(news: news))
    }
}
