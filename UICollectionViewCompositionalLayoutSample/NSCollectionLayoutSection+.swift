//
//  NSCollectionLayoutSection+.swift
//  UICollectionViewCompositionalLayoutSample
//
//  Created by Shota Nakagami on 2020/02/19.
//  Copyright © 2020 Shota Nakagami. All rights reserved.
//

import UIKit

extension NSCollectionLayoutSection {
    static func list(height: CGFloat) -> NSCollectionLayoutSection {
        let subitem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(height)
            ),
            subitem: subitem,
            count: 1
        )
        group.interItemSpacing = .fixed(1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1
        section.contentInsets = .init(top: 1, leading: 1, bottom: 0, trailing: 1)
        
        return section
    }
    
    static func autoSizingList() -> NSCollectionLayoutSection {
        let subitem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(44)
            ),
            subitem: subitem,
            count: 1
        )
        group.interItemSpacing = .fixed(1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1
        section.contentInsets = .init(top: 1, leading: 1, bottom: 0, trailing: 1)
        
        return section
    }
    
    static func grid(column: Int) -> NSCollectionLayoutSection {
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
        
        return section
    }
    
    static func horizontalScroll(column: Int, margin: CGFloat) -> NSCollectionLayoutSection {
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
        group.interItemSpacing = .fixed(margin)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = margin
        section.contentInsets = .init(top: margin, leading: margin, bottom: margin, trailing: margin)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
}
