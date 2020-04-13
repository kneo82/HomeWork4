//
//  ArticlesViewModel.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 13.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final class ArticlesViewModel: ObservableObject {
    
    let pageSize = 10
    
    var page = 0
    var totalResults = 0

    var locator: ServiceLocator?
    
    @Published private(set) var articles: [ArticleModel] = [ArticleModel]()

    init(locator: ServiceLocator?) {
        self.locator = locator
    }
    
    func loadPage() {
        guard locator != nil else {
            return
        }
        
        page += 1
        
        if let service = locator?.getServiceOf(ArticlesService.self)  {
            service.getArticles(q: "bitcoin", pageSize: pageSize, page: page) { articles, totalResults in
                self.articles.append(contentsOf: articles)
                self.totalResults = totalResults
            }
        }
    }
}
