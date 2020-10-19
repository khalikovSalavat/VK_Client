//
//  NewsCell.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 25.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class NewsCell_old: UITableViewCell {
    
    @IBOutlet private weak var avatar: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var publishTimeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var newsText: UITextView!
    @IBOutlet private weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.cornerRadius = avatar.frame.width / 2
        
        newsText.isEditable = true
        newsText.isEditable = false
        newsText.isScrollEnabled = false   
    }
}
