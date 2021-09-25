//
//  CategoryTableViewCell.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    let categories = Constants.CATEGORIES
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ItemCategoryCollectionViewCell.self, forCellWithReuseIdentifier: "ItemCategoryCollectionViewCell")
        collection.backgroundColor = .systemBackground
        collection.showsHorizontalScrollIndicator = false

        return collection
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        contentView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CategoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCategoryCollectionViewCell", for: indexPath) as! ItemCategoryCollectionViewCell
        cell.configure(categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = contentView.frame.size.width / 3.2
        return CGSize(width: width, height: width / 1.8)
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CryptoTableViewCell_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        CategoryTableViewCell().showPreview()
            .previewLayout(.sizeThatFits)
            .frame(width: 500, height: 200, alignment: .center)
    }
}
#endif
