//
//  NewsListWorker.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 23.10.2022.
//

import Foundation

class NewsListWorker: NewsListWorkerLogic {
    
    private let decoder = JSONDecoder()
    private let session = URLSession.shared
    
    func getNews(_ request: Model.GetNews.Request, completion: @escaping ((Model.News) -> ())) {
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-10-23&to=2022-10-23&sortBy=popularity&apiKey=ba80e2dd17a34e86a360b8faf4e5c7db") else {
            return
        }
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            if
                let data = data,
                let news = try? self?.decoder.decode(Model.News.self, from: data)
            {
                completion(news)
            } else {
                print("Could not get any content")
            }
        }

        task.resume()
    }
}
