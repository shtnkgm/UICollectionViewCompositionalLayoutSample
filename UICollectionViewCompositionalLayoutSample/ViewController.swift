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
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, Item> = {
        let dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) {
                (collectionView: UICollectionView, indexPath: IndexPath, item: Item) -> UICollectionViewCell? in
            return (collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell).set(text: item.title)
        }
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.applyDataSource()
        }
    }
    
    private func setCollectionView() {
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.mixed(glidColumn: 4, listHeight: 60)
        
        let nib = UINib(nibName: CustomCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CustomCell.identifier)
        // collectionView.dataSource = self
    }
    
    private func applyDataSource() {
        let listItems: [Item] = (1...Int.random(in: 1...20)).map { Item(title: "0-\($0)") }
        let gridItems: [Item] = (1...Int.random(in: 1...20)).map { Item(title: "1-\($0)") }
        let horizontalScrollItems: [Item] = (1...Int.random(in: 1...20)).map { Item(title: "2-\($0)") }
        
        let longText = String(repeating: "あのイーハトーヴォの透き通った風、夏でも底に冷たさを持つ青い空、美しい森で飾られたモリーオ市、郊外のぎらぎら光る草の波。", count: Int.random(in: 1...10))
        let autoSizingListItems: [Item] = (1...Int.random(in: 1...20)).map { _ in Item(title: longText) }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(listItems, toSection: .list)
        snapshot.appendItems(gridItems, toSection: .grid)
        snapshot.appendItems(horizontalScrollItems, toSection: .horizontalScroll)
        // snapshot.appendItems(autoSizingListItems, toSection: .autoSizingList)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

//extension ViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 5
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let longText = String(repeating: "あのイーハトーヴォの透き通った風、夏でも底に冷たさを持つ青い空、美しい森で飾られたモリーオ市、郊外のぎらぎら光る草の波。", count: Int.random(in: 1...10))
//        let text = indexPath.section != 3 ? "\(indexPath.section)-\(indexPath.row)" : longText
//
//        return (collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell).set(text: text)
//    }
//}

