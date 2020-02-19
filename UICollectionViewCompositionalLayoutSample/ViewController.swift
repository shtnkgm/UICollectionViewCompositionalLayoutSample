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
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(height: 60)
        // collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.grid(column: 4)
        
        let nib = UINib(nibName: CustomCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CustomCell.identifier)
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
        return (collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell).set(text: "\(indexPath.section)-\(indexPath.row)")
    }
}

