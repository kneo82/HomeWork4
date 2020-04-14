//
//  ArticlesListCache.swift
//  HomeWork4
//
//  Created by Vitaliy Voronok on 14.04.2020.
//  Copyright © 2020 Vitaliy Voronok. All rights reserved.
//

import Foundation

public final class ArticleListCache {
    public static let shared = ArticleListCache()
    var articlesList = [String: [ArticleModel]]()
    let fileManager: FileManager = FileManager.default
    
    lazy var cachesDirectory: URL? = {
        if let url = FileManager.default.urls(for: .cachesDirectory, in: .allDomainsMask).first {
            return url.appendingPathComponent("ArticlesListCache")
        }
        return nil
    }()
    
    private init() {
        
    }
    
    public func getArticles(q: String, pageSize: Int, page: Int, handler: @escaping (_ articles: [ArticleModel], _ totalResults: Int) -> Void) {
        guard let articles = articlesList[q] else {
            handler([ArticleModel](), 0)
            return
        }
        let startIndex = min(max((page - 1) * pageSize, 0), articles.count)
        let endIndex = min(page * pageSize, articles.count)
        let result = Array(articles[startIndex..<endIndex])
        return handler(result, result.count)
    }
    
    public func addArticlesToCache(q: String, articles: [ArticleModel]) {
        if articlesList[q] == nil {
            articlesList[q] = articles
        } else {
            articlesList[q]?.append(contentsOf: articles)
        }
    }
    
    func readCacheFromFile() {
        guard let cachesDirectory = cachesDirectory, isCacheDirectoryExist() else {
            return
        }
        
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: cachesDirectory, includingPropertiesForKeys: nil)
            
            fileURLs.forEach { url in
                do {
                    let data = try Data(contentsOf: url)
                    let articles = try JSONDecoder().decode([ArticleModel].self, from: data)
                    self.articlesList[url.lastPathComponent] = articles
                } catch {
                    print("Errorr load cache from file: \(url.path), error: \(error.localizedDescription)")
                }
            }
        } catch {
            print("Error while enumerating files \(cachesDirectory.path): \(error.localizedDescription)")
        }
    }
    
    func saveCacheToFile() {
        guard let cachesDirectory = cachesDirectory, isCacheDirectoryExist() else {
            return
        }
        
        articlesList.forEach { key, value in
            let url = cachesDirectory.appendingPathComponent(key)
            do {
                let data = try JSONEncoder().encode(value)
                try data.write(to: url)
            } catch {
                print("Error cache to file \(url.path): \(error.localizedDescription)")
            }
        }
        
    }
    
    func isCacheDirectoryExist() -> Bool {
        guard let cachesDirectory = cachesDirectory else {
            return false
        }
        
        if !fileManager.fileExists(atPath: cachesDirectory.path) {
            do {
                try fileManager.createDirectory(at: cachesDirectory, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error.localizedDescription);
                
                return false
            }
        }
        
        return true
    }
}
