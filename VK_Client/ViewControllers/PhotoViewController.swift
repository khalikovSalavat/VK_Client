//
//  PhotoViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 09.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit
import RealmSwift

class PhotoViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
//    @IBOutlet weak var nameField: UITextField!
    
    let realmManager = RealmManager.shared
    var image: UIImage!
    var userId: Int = 0
    var token: NotificationToken?
    
    private var photos: Results<PhotoItem>? {
        let results: Results<PhotoItem>? = realmManager?.getObjects().filter("ownerId = " + "\(userId)")
        return results
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.isUserInteractionEnabled = true
        
        loadPhotos()
        
        addPhotosObserver()
    }
    
    func loadPhotos() {
        SessionManager.shared.loadPhotos(token: Session.shared.token, userId: userId) { [weak self] result in
            switch result {
            case let .success(photos):
                let photos = photos.response.items
                DispatchQueue.main.async {
                    try? self?.realmManager?.add(objects: photos)
                    self?.collectionView.reloadData()
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func addPhotosObserver() {
        token = photos?.observe { (changes: RealmCollectionChange) in
            switch changes {
            case .initial(let result):
//                print(result)
                break
            case .update(let result, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                print("results: \(result)\ndeletions:\(deletions)\ninsertions:\(insertions)\nmodifications:\(modifications)")
                break
            case .error(let error):
                print(error)
                break
            }
        }
    }
}

extension PhotoViewController: UICollectionViewDelegate {

}

extension PhotoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: PhotoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell else { fatalError() }
        let url = URL(string: photos![indexPath.row].sizes.last!.url)!
        cell.photo.sd_setImage(with: url, completed: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "detailedVC") as? DetailedPhotoViewController else {
            fatalError()
        }
        vc.sourceIndex = indexPath.row
        vc.photoItems = photos
        navigationController?.pushViewController(vc, animated: true)
    }
}
