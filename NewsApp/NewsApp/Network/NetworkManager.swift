//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Krystsina on 2023-04-12.
//

import Foundation

final class NetworkManager {
    
    func loadData() async -> [ArticleModel]? {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=baab54b9027042eda3ce59e588d44a1e"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(NewsModel.self, from: data) {
                return decodedResponse.articles ?? []
            }
        } catch {
            print("Invalid data")
        }
        return nil
    }
}
