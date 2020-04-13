//
//  ArticleModel.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 13.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

public struct ArticlesModel: Codable {
    let pageSize = 20
    public var page = 0
    public var articles: [ArticleModel]?
}

public struct ArticleModel: Codable {
    public var author: String?
    public var title: String?
    public var description: String?
    public var url: String?
}

extension ArticleModel: Identifiable {
    public var id: String {
        self.title ?? UUID().uuidString
    }
}
