//
//  ViewController.swift
//  FriendsCollection
//
//  Created by Seunghun Yang on 2021/03/16.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    let cellIdentifier: String = "cell"
    var friends: [Friend] = []
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        
        let halfWidth: CGFloat = UIScreen.main.bounds.width / 2.0
        flowLayout.itemSize = CGSize(width: halfWidth - 20, height: 110)
        self.collectionView.collectionViewLayout = flowLayout
        
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "friends") else {
            return
        }
        
        do {
            self.friends = try jsonDecoder.decode([Friend].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        
        self.collectionView.reloadData()
    }

    // MARK: - CollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: FriendCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? FriendCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let friend = friends[indexPath.item]
        
        cell.nameAgeLabel.text = friend.nameAndAge
        cell.adressLabel.text = friend.fullAddress
        
        return cell
    }
}

