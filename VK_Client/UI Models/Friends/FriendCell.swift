//
//  friendCell.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 08.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
//    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var avatarView: UIView!
    @IBOutlet private weak var avatarImage: UIImageView!
    @IBInspectable var radius: Int = 35
    var friendID: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarView.layer.cornerRadius = CGFloat(radius) //avatarView.bounds.width / 2
        avatarView.layer.shadowColor = UIColor.black.cgColor
        avatarView.layer.shadowRadius = CGFloat(radius + 3)
        avatarView.layer.shadowOpacity = 0.5
        avatarView.layer.shadowRadius = 3
        avatarView.layer.shadowPath = UIBezierPath(ovalIn: avatarView.bounds).cgPath
        
        avatarImage.layer.cornerRadius = CGFloat(radius) //avatarView.bounds.width / 2
        avatarImage.clipsToBounds = true
    }
}
