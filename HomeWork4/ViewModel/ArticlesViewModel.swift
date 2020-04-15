//
//  ArticlesViewModel.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 13.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation
import Combine

final class ArticlesViewModel: ObservableObject {
    
    var locator: ServiceLocator?
    
    var settingModel: SettingViewModel
    @Published private(set) var articles: [ArticleModel] = [ArticleModel]()
    
    var page = 0
    var totalResults = 0
    
    var isShowImages: Bool {
        return settingModel.model.showImages
    }

    private var querySubscriber: AnyCancellable? = nil
    private var pageSubscriber: AnyCancellable? = nil
    private var imageSubscriber: AnyCancellable? = nil
    
    init(locator: ServiceLocator?, settingModel: SettingViewModel) {
        self.locator = locator
        self.settingModel = settingModel
        
        self.subscribe()
    }
    
    func subscribe() {
        querySubscriber = self.settingModel.$query.sink(receiveValue: { [weak self ] _ in
            self?.reload()
        })
        
        pageSubscriber = self.settingModel.$pageSize.sink(receiveValue: { _ in
            self.reload()
        })
        
        imageSubscriber = self.settingModel.$showImages.sink(receiveValue: { _ in
            self.reload()
        })
    }
    
    func reload() {
        self.page = 0
        self.articles = [ArticleModel]()
        self.loadPage()
    }
    
    func loadPage() {
        guard locator != nil else {
            return
        }
        
        page += 1
        
        if let service = locator?.getServiceOf(ArticlesService.self)  {
            service.getArticles(q: settingModel.model.queryString, pageSize: settingModel.model.pageSize, page: page) { articles, totalResults in
                self.articles.append(contentsOf: articles)
                self.totalResults = totalResults
            }
        }
    }
}
