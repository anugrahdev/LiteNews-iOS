//
//  ItemCategoryCollectionViewCell.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import UIKit
import SnapKit

class ItemCategoryCollectionViewCell: UICollectionViewCell {
    
    lazy var categoryLabel: UILabel = {
       let label = UILabel()
        label.text = "Category"
        label.textColor = .white
        return label
    }()
    
    lazy var categoryImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sports")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(categoryImage)
        categoryImage.addBlur(alpha: 0.87)
        categoryImage.addSubview(categoryLabel)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryLabel.frame = contentView.bounds
        categoryImage.frame = contentView.bounds

        categoryLabel.snp.makeConstraints { make in
            make.center.equalTo(categoryImage.center)
        }
        
    }
    
    
    func configure(_ text: String){
        self.categoryLabel.text = text
        self.categoryImage.image = UIImage(named: text.lowercased())
      
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ItemCategoryCollectionViewCell_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        ItemCategoryCollectionViewCell().showPreview()
            .previewLayout(.sizeThatFits)
            .frame(width: 500, height: 200, alignment: .center)
    }
}
#endif
