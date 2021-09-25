//
//  NewsEndpoint.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import Foundation
import Alamofire

enum NewsEndpoints : APIConfiguration {
    
    case topHeadlines(_ request: HeadlinesRequest)
    case sources
    case searchNews
    
    internal var baseURL: String {
        let url = URL(string: Constants.BASE_URL)!
        let baseURL = url.appendingPathComponent(path)
        return baseURL.absoluteString
    }
    
    internal var path: String {
        switch self {
        case .topHeadlines(_):
            return "top-headlines"
        case .sources:
            return "sources"
        case .searchNews:
            return "everything"
        }
    }
    
    var query: Dictionary<String, Any> {
        switch self {
        case .topHeadlines(let request):
            return request.toParameters()
        default:
            print("cek")
            return [:]
        }
    }
    
    var headers: HTTPHeaders{
        let request : HTTPHeaders = [
            .authorization(Keys.API_KEY)
        ]
        
        switch self {
        case .topHeadlines(_):
            return request
        default:
            return request
        }
    }
    
    
}
