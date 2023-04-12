//
//  SourceModel.swift
//  NewsApp
//
//  Created by Krystsina on 2023-04-12.
//

import Foundation

struct SourceModel: Decodable {
    var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}
