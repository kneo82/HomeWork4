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
    
    init(article: ArticleModel?) {
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
}

