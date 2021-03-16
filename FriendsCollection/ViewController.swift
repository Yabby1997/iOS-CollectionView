//
//  ViewController.swift
//  FriendsCollection
//
//  Created by Seunghun Yang on 2021/03/16.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    var numberOfCells: Int = 10
    let cellIdentifier: String = "cell"
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
    }

    // MARK: - CollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        return cell
    }
}

