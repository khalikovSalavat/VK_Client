//
//  PhotoViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 09.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

var selectedFriend: String?

class PhotoViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nameField: UITextField!
    
//    var photos: [ String: Int] = [
//        "КиануРивз" : 3,
//        "КэрриМосс" : 3,
//        "ЛоуренсФишборн" : 3,
//    ]
    
    var image: UIImage!
    
//    func getPhoto (NameSurname key: String) -> [UIImage]? {
//        var tempArr: [UIImage] = []
//        for _ in photos {
//            for i in 0...(photos[key]! - 1) {
//                guard UIImage(named: key + String(i)) != nil else { return nil }
//                tempArr.append(UIImage(named: key + String(i))!)
//            }
//        }
//        return tempArr
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension PhotoViewController: UICollectionViewDelegate {

}

extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PhotoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell else { fatalError() }
        
        cell.photo.image = self.image//UIImage(named: friends[indexPath.row].key)
//        print("index: \(indexPath.row) name: \(friends[indexPath.row].key)")
        
        return cell
    }
}
