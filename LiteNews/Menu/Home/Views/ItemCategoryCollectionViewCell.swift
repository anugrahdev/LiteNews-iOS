//
//  ItemCategoryCollectionViewCell.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import UIKit

class ItemCategoryCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(_ item: UIColor){
        contentView.backgroundColor = item
    }
}
