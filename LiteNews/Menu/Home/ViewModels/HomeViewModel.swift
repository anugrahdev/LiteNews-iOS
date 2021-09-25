//
//  HomeViewModel.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import Foundation
import RxSwift

class HomeViewModel: BaseViewModel {
    
    let repository = NewsRepository()
    
    func fetchHeadlines() {
        let request = HeadlinesRequest(country: "us", category: "sports", sources: "", pageSize: 10, page: 1)
        repository.fetchHeadlines(request)
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { [unowned self] result in
                switch result {
                case .success(let model):
                    print("ahdehh cek \(model.articles?.count)")
                case .failure(let error):
                    self.error.onNext(error)
                }
                self.state.onNext(.finish)
                
            }, onFailure: { [unowned self] error in
                self.state.onNext(.error)
            }).disposed(by: disposeBag)

    }
    
}
