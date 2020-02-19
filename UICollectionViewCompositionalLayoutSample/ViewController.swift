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
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.mixed(glidColumn: 4, listHeight: 60)
        
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
        let longText = String(repeating: "あのイーハトーヴォの透き通った風、夏でも底に冷たさを持つ青い空、美しい森で飾られたモリーオ市、郊外のぎらぎら光る草の波。", count: Int.random(in: 1...10))
        let text = indexPath.section != 3 ? "\(indexPath.section)-\(indexPath.row)" : longText
        
        return (collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell).set(text: text)
    }
}

