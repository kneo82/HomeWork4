//
//  ArticleModel.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 13.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation
import NewsAPI

final class ArticlesService {
    
    private let apiKey = "e537a838d9f743f0add591558b1caae7"
    
    func getArticles(q: String? = nil, pageSize: Int, page: Int, handler: @escaping (_ articles: [ArticleModel], _ totalResults: Int) -> Void) {
        
        let status = Reach().connectionStatus()
        
        switch status {
        case .unknown, .offline:
            ArticleListCache.shared.getArticles(q: q ?? "withoutQuery", pageSize: pageSize, page: page, handler: handler)
            
        case .online:
            NewsAPI.getNews(apiKey: apiKey, q: q, pageSize: pageSize, page: page) { (news, error) in
                if let articles = news?.articles {
                    let result = articles.map { ArticleModel.init(author: $0.author, title: $0.title, description: $0.description, url: $0.url, urlToImage: $0.urlToImage, publishedAt: $0.publishedAt, content: $0.content) }
                    
                    handler(result, news?.totalResults ?? 0)
                    ArticleListCache.shared.addArticlesToCache(q: q ?? "withoutQuery", articles: result)
                    
                } else if let error = error {
                    print("News failed with error: \(error.localizedDescription)")
                    print(error.localizedDescription)
                    handler([ArticleModel](), 0)
                }
            }
        }
        
    }
}
