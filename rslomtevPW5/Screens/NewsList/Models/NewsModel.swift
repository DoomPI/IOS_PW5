//
//  NewsModel.swift
//  rslomtevPW5
//
//  Created by Роман Ломтев on 23.10.2022.
//

import Foundation

enum NewsModel {
    
    enum GetNews {
        struct Request {}
        struct Response {
            var news: NewsNetwork
        }
        struct ViewModel {
            var news: News
        }
    }
    
    struct ArticleNetwork: Decodable {
        let title: String
        let description: String
        let imageURL: URL?
        
        enum CodingKeys: String, CodingKey {
            case title = "title"
            case description = "description"
            case imageURL = "urlToImage"
        }
    }
    
    struct NewsNetwork: Decodable {
        let articles: [ArticleNetwork]?
        
        enum CodingKeys: String, CodingKey {
            case articles = "articles"
        }
    }
    
    struct News {
        let articles: [Article]?
    }
    
    class Article {
        let title: String
        let description: String
        let imageURL: URL?
        var imageData: Data? = nil
        
        init(title: String, description: String, imageURL: URL?) {
            self.title = title
            self.description = description
            self.imageURL = imageURL
        }
    }
}
