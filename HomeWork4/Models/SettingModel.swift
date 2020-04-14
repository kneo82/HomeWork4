//
//  SettingModel.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 14.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

final public class SettingModel: Codable {
    public var queryString: String
    public var pageSize: Int
    public var showImages: Bool
    
    public init(queryString: String, pageSize: Int, showImages: Bool) {
        self.queryString = queryString
        self.pageSize = pageSize
        self.showImages = showImages
    }
    
    public static var defaultSettings: SettingModel {
        SettingModel(queryString: "bitcoin", pageSize: 20, showImages: true)
    }
}
