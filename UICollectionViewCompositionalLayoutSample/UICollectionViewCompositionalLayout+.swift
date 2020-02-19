//
//  UICollectionViewCompositionalLayout+.swift
//  UICollectionViewCompositionalLayoutSample
//
//  Created by Shota Nakagami on 2020/02/19.
//  Copyright © 2020 Shota Nakagami. All rights reserved.
//

import UIKit

extension UICollectionViewCompositionalLayout {
    static func list(height: CGFloat) -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(section: .list(height: height))
    }
    
    static func grid(column: Int) -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout(section: .grid(column: column))
    }
    
    static func mixed(glidColumn: Int, listHeight: CGFloat) -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            if sectionIndex % 2 == 0 {
                return .grid(column: glidColumn)
            } else {
                return .list(height: listHeight)
            }
        }
    }
}
