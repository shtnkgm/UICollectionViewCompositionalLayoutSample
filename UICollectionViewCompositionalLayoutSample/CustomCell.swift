//
//  CustomCell.swift
//  UICollectionViewCompositionalLayoutSample
//
//  Created by Shota Nakagami on 2020/02/18.
//  Copyright © 2020 Shota Nakagami. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    static let identifier = "CustomCell"
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(text: String) -> Self {
        label.text = text
        return self
    }
}
