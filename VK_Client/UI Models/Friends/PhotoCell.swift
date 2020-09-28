//
//  PhotoCell.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 12.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
//    var selectedFotoId: Int = 0
    
//    let likeControl = LikeControl()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        addSubview(likeControl)
        
//        likeControl.translatesAutoresizingMaskIntoConstraints = false
        
//        let likeConstraints = [
//            likeControl.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
//            likeControl.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ]
//        NSLayoutConstraint.activate(likeConstraints)
//        likeControl.isUserInteractionEnabled = true
//        superview?.bringSubviewToFront(likeControl)
//        likeControl.addTarget(self, action: #selector(likeControl.onHeartTapped(_:)), for: .touchUpInside)
    }
}
