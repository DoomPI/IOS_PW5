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
            var news: News
        }
        struct ViewModel {
            var news: News
        }
    }
    
    struct Article: Decodable {
        let title: String
        let description: String
        let imageURL: URL?
        
        enum CodingKeys: String, CodingKey {
            case title = "title"
            case description = "description"
            case imageURL = "urlToImage"
        }
    }
    
    struct News: Decodable {
        let articles: [Article]?
        
        enum CodingKeys: String, CodingKey {
            case articles = "articles"
        }
    }
}
