//
//  UICollectionViewCompositionalLayout+.swift
//  UICollectionViewCompositionalLayoutSample
//
//  Created by Shota Nakagami on 2020/02/19.
//  Copyright © 2020 Shota Nakagami. All rights reserved.
//

import UIKit

extension UICollectionViewCompositionalLayout {
    static func grid(column: Int) -> UICollectionViewCompositionalLayout {
        let subitem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1 / CGFloat(column)),
                heightDimension: .fractionalHeight(1)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1 / CGFloat(column))
            ),
            subitem: subitem,
            count: column
        )
        group.interItemSpacing = .fixed(1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1
        section.contentInsets = .init(top: 1, leading: 1, bottom: 0, trailing: 1)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
