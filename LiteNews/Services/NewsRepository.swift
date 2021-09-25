//
//  NewsRepository.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import RxSwift

struct NewsRepository {
    func fetchHeadlines(_ request: HeadlinesRequest) -> Single<Result<HeadlinesBaseModel, Error>> {
        return APIClient.shared.request(endpoint: NewsEndpoints.topHeadlines(request))
    }
}
