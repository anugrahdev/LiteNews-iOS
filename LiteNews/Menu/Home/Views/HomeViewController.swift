//
//  HomeViewController.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue

        ApiService.shared.fetchTopHeadlines("us", "sports", "", "10", 1) { result in
            switch result {
            case .success(let model):
                print("success \(model.articles?.count)")
            case .failure(let error):
                print("error \(error)")
            }
        }
    }
    
}
