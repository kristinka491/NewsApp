//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Krystsina on 2023-04-12.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var news = [ArticleModel]()
    
    private let networkManager = NetworkManager()
    
    func loadData() async {
        Task { @MainActor in
            news = await networkManager.loadData() ?? []
        }
    }
}
