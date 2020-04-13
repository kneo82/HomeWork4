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
    
    func getArticles(handler: @escaping ([ArticleModel]) -> Void) {
        NewsAPI.getNews(country: "ru", apiKey: apiKey) { (news, error) in
            if let articles = news?.articles {
                let result = articles.map { ArticleModel.init(author: $0.author, title: $0.title, description: $0.description, url: $0.url) }
              handler(result)
            } else if let error = error {
              print("News failed with error: \(error.localizedDescription)")
              print(error.localizedDescription)
                handler([ArticleModel]())
            }
        }
    }
}
