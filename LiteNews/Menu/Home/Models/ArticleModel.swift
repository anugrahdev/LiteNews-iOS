//
//  ArticleModel.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import Foundation

// MARK: - Article
struct ArticleModel: Codable {
    let source: SourceModel?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct SourceModel: Codable {
    let id: String?
    let name: String?
}
