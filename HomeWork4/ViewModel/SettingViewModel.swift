//
//  SettingViewModel.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 14.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final class SettingViewModel: ObservableObject {
    private(set) var model: SettingModel
    
    @Published var query: String {
        didSet {
            model.queryString = query
        }
    }
    
    @Published var pageSize: String {
        didSet {
            model.pageSize = Int(pageSize) ?? model.pageSize
        }
    }
    
    @Published var showImages: Bool {
        didSet {
            model.showImages = showImages
        }
    }
    
    init(settings: SettingModel) {
        self.model = settings
        self.query = settings.queryString
        self.pageSize = "\(settings.pageSize)"
        self.showImages = settings.showImages
    }
}
