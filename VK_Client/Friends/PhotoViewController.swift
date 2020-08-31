//
//  PhotoViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 09.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

//var selectedFriend: String?

class PhotoViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nameField: UITextField!
    
    var image: UIImage!
    var photoURLs: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
}

extension PhotoViewController: UICollectionViewDelegate {

}

extension PhotoViewController: UICollectionViewDataSource {
    func loadPhotos (indexpathRow: Int) {
        SessionManager.shared.loadPhotos(token: Session.shared.token, userId: Session.shared.userID) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(photos):
                self.photoURLs = PhotoQuery.getURLsBySize(photosQuery: photos, size: .o)
//                self.photoURLs = photos.items[indexpathRow].sizes
            case let .failure(error):
                print(error)
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return friends[selectedFriend!]?.photoCollection.count ?? 1
        return photoURLs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PhotoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell else { fatalError() }
        
//        cell.photo.image = friends[selectedFriend!]!.photoCollection[indexPath.row].image
//        cell.likeControl.count = friends[selectedFriend!]?.photoCollection[indexPath.row].likesCount as! Int
//        guard let url: String = getURLOfPicFromSize(photo: photos[indexPath.row], size: .m) else { return cell }
//        let photosUrls = Photo.getImagesPathBySize(photos: photos, size: .o)
        let url = photoURLs[indexPath.row]
        cell.photo.sd_setImage(with: URL(fileURLWithPath: url), completed: nil)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "detailedVC") as? DetailedPhotoViewController else {
            fatalError()
        }
        vc.currentIndex = indexPath.row
//        vc.imageURLs = Photo.getImagesPathBySize(photos: photos, size: .o)
        navigationController?.pushViewController(vc, animated: true)
    }
}
