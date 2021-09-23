//
//  ApiService.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import Foundation
import Alamofire

protocol ApiServiceDelegate {
    func fetchTopHeadlines(_ country: String, _ category: String, _ sources: String, _ pageSize:String, _ page:Int, completion: @escaping (Result<HeadlinesBaseModel, Error>) -> Void)
    func fetchSources(_ category: String, _ country: String, completion: @escaping (Result<HeadlinesBaseModel, Error>) -> Void)
    func fetchSearchNews(_ q: String, _ language: String, completion: @escaping (Result<HeadlinesBaseModel, Error>) -> Void)

}

class ApiService: ApiServiceDelegate {
    
    static let shared = ApiService()
    
    func fetchTopHeadlines(_ country: String, _ category: String, _ sources: String, _ pageSize: String, _ page: Int, completion: @escaping (Result<HeadlinesBaseModel, Error>) -> Void) {
        
        let params: [String: Any] = [
            "country" : country,
            "category": category,
            "sources": sources,
            "pageSize": pageSize,
            "page": page
        ]
        
        let headers: HTTPHeaders = [
            "X-Api-Key" : Keys.API_KEY
        ]
        
        AF.request("\(Constants.BASE_URL)top-headlines", method: .get, parameters: params, headers: headers)
            .validate(statusCode: 200..<400)
            .responseDecodable(of: HeadlinesBaseModel.self){ response in
            debugPrint(response)
            switch response.result{
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        
    }
    
    func fetchSources(_ category: String, _ country: String, completion: @escaping (Result<HeadlinesBaseModel, Error>) -> Void) {
        
    }
    
    func fetchSearchNews(_ q: String, _ language: String, completion: @escaping (Result<HeadlinesBaseModel, Error>) -> Void) {
        
    }
    
}
