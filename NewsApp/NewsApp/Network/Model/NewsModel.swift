//
//  NewsModel.swift
//  NewsApp
//
//  Created by Krystsina on 2023-04-12.
//

import Foundation

struct NewsModel: Decodable {
    var articles: [ArticleModel]?
    
    private enum CodingKeys: String, CodingKey {
        case articles
    }
}
