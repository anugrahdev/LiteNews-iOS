//
//  APIClient.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire


class APIClient {
    static let shared = {
        APIClient()
    }()
    
    func request<T: Codable>(endpoint: APIConfiguration) -> Single<Result<T, Error>> {
        return Single<Result<T, Error>>.create { single in
            AF.request(endpoint.baseURL, parameters: endpoint.query, headers: endpoint.headers).responseDecodable(of: T.self){ response in
                debugPrint(response)
                
                switch response.result {
                case .success(let model):
                    
                    print("cek Sukses")
                    single(.success(.success(model)))
                case .failure(let error):
                    print("cek gagal")
                    single(.failure(error))
                }
            }
            return Disposables.create {
            }
        }
    }
}
