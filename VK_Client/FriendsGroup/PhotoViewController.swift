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
    
    var image: UIImage!

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
        return friends[selectedFriend!]?.photoCollection.count ?? 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PhotoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell else { fatalError() }
        
//        cell.photo.image = self.image//UIImage(named: friends[indexPath.row].key)
        cell.photo.image = friends[selectedFriend!]!.photoCollection[indexPath.row].image
//        print("index: \(indexPath.row) name: \(friends[indexPath.row].key)")
        cell.likeControl.count = friends[selectedFriend!]?.photoCollection[indexPath.row].likesCount as! Int
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "detailedVC") as? DetailedPhotoViewController else {
            fatalError()
        }
        vc.images = friends[selectedFriend!]?.photoCollection.map { $0.image } as! [UIImage]
        vc.currentIndex = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
}
