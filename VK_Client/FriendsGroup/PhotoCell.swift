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
    var selectedFotoId: Int = 0
    
    let likeControl = LikeControl()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(likeControl)
        
        likeControl.translatesAutoresizingMaskIntoConstraints = false
        
        let likeConstraints = [
            likeControl.rightAnchor.constraint(equalTo: self.rightAnchor),
            likeControl.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(likeConstraints)
    }
}
