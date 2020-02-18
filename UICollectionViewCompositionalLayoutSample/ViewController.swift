//
//  ViewController.swift
//  UICollectionViewCompositionalLayoutSample
//
//  Created by Shota Nakagami on 2020/02/18.
//  Copyright © 2020 Shota Nakagami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    private func setCollectionView() {
        
        let subitem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1 / 3),
                heightDimension: .fractionalHeight(1)
            )
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1 / 3)
            ),
            subitem: subitem,
            count: 3
        )
        group.interItemSpacing = .fixed(1)
        let spacing = NSCollectionLayoutSpacing.fixed(1)
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: spacing, top: spacing, trailing: spacing, bottom: nil)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 1
        
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = compositionalLayout
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
        collectionView.dataSource = self
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return (collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell).set(text: "\(indexPath.section)-\(indexPath.row)")
    }
}

