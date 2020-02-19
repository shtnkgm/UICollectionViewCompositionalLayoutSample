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
        return .init(section: .list(height: height))
    }
    
    static func grid(column: Int) -> UICollectionViewCompositionalLayout {
        return .init(section: .grid(column: column))
    }
    
    static func mixed(glidColumn: Int, listHeight: CGFloat) -> UICollectionViewCompositionalLayout {
        return .init { sectionIndex, layoutEnvironment in
            if sectionIndex % 3 == 0 {
                return .grid(column: glidColumn)
            } else if sectionIndex % 3 == 1 {
                return .list(height: listHeight)
            } else {
                return .horizontalScroll(column: glidColumn, margin: 20)
            }
        }
    }
}
