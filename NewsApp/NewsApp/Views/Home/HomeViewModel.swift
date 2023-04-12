//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Krystsina on 2023-04-12.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var news = [ArticleModel]()
    
    
    func loadData() async {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=baab54b9027042eda3ce59e588d44a1e") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(NewsModel.self, from: data) {
                news = decodedResponse.articles ?? []
            }
        } catch {
            print("Invalid data")
        }
    }
    
    func getDateFromString(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: dateString) ?? Date()
    }
}
