//
//  HeadlinesBaseModel.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import Foundation

// MARK: - HeadlinesBaseModel
struct HeadlinesBaseModel: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [ArticleModel]?
}


