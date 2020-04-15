//
//  SettingSaveService.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 14.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

public final class SettingSaveService {
    
    let fileManager: FileManager = FileManager.default
    
    lazy var filePath: URL? = {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return url.appendingPathComponent("ArticlesSettings")
        }
        return nil
    }()
    
    func saveSettings(settings: SettingModel) {
        guard let filePath = filePath else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(settings)
            try data.write(to: filePath)
        } catch {
            print("Error cache to file \(filePath.path): \(error.localizedDescription)")
        }
    }
    
    func readSettings() -> SettingModel {
        var result = SettingModel.defaultSettings
        
        guard let filePath = filePath else {
            return result
        }
        
        do {
            let data = try Data(contentsOf: filePath)
            let settings = try JSONDecoder().decode(SettingModel.self, from: data)
            result = settings
        } catch {
            print("Errorr load cache from file: \(filePath.path), error: \(error.localizedDescription)")
        }
        
        return result
    }
}
