//
//  ArticleViewModel.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 13.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final class ArticleViewModel: ObservableObject {
    private var article: ArticleModel?
    
    @Published var isShowImage = true
    
    init(article: ArticleModel?, isShowImage: Bool = true) {
        self.article = article
    }
    
    var title: String {
        article?.title ?? ""
    }
    
    var url: String {
        article?.url ?? ""
    }
    
    var description: String {
        article?.description ?? ""
    }
    
    var author: String {
        article?.author ?? ""
    }
    
    var urlToImage: String {
        article?.urlToImage ?? ""
    }
    
    var publishedAt: String {
        article?.publishedAt ?? ""
    }
    
    var content: String {
        article?.content ?? ""
    }
}
