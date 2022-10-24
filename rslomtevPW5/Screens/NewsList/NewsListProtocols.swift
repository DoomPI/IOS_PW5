//
//  NewsListProtocols.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 24.10.2022.
//

protocol NewsListDisplayLogic : AnyObject {
    typealias Model = NewsModel
    func display(data: Model.GetNews.ViewModel)
}

protocol NewsListPresentationLogic {
    typealias Model = NewsModel
    func present(_ response: Model.GetNews.Response)
}

protocol NewsListBusinessLogic {
    typealias Model = NewsModel
    func fetchNews(_ request: Model.GetNews.Request)
}

protocol NewsListWorkerLogic {
    typealias Model = NewsModel
    func getNews(_ request: Model.GetNews.Request, completion: @escaping ((Model.News) -> ()))
}

protocol NewsListRoutingLogic {
    typealias Model = NewsModel
    func navigateToNewsScreen(article: Model.Article)
    func navigateBack()
}
