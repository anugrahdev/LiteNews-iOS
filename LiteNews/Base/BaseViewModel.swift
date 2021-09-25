//
//  BaseViewModel.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import RxSwift
import RxCocoa

enum NetworkState {
    case initial
    case loading
    case finish
    case error
    case success
}

enum DataLoadState {
    case new
    case loadmore
}

class BaseViewModel {
    
    let disposeBag  = DisposeBag()
    var state       = PublishSubject<NetworkState>()
    var hudeState   = PublishSubject<NetworkState>()
    var error       = PublishSubject<Error>()
  
}
