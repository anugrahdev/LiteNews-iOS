//
//  APIConfiguration.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import Foundation
import Alamofire

protocol APIConfiguration {
    var baseURL: String { get }
    var path: String { get }
    var query: Dictionary<String, Any> { get }
    var headers: HTTPHeaders { get }
}
