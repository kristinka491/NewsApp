//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Krystsina on 2023-04-12.
//

import Foundation

struct ArticleModel: Decodable {
    var author: String?
    var title: String?
    var publishedAt: String?
    var url: String?
    var imageURL: String?
    var description: String?
    var source: SourceModel?
    
    private enum CodingKeys: String, CodingKey {
        case author, title, publishedAt, url, imageURL = "urlToImage", description, source
    }
    
    var websiteURL: URL {
        guard let url = URL(string: url ?? "") else {
            fatalError("Incorrect URL")
        }
        return url
    }
    
    var publishedDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: publishedAt ?? "") ?? Date()
    }
}
