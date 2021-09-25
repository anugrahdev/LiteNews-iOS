//
//  HeadlinesRequest.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import Foundation

struct HeadlinesRequest {
    static var request = HeadlinesRequest()
        
    var country: String = ""
    var category: String = ""
    var sources: String = ""
    var pageSize: Int = 10
    var page: Int = 1
}

extension HeadlinesRequest {
    func toParameters() -> [String : Any] {
        var dict : [String : Any] = [:]
        dict["country"] = country
        dict["category"] = category
        dict["sources"] = sources
        dict["pageSize"] = pageSize
        dict["page"] = page
        
        return dict
    }
}
