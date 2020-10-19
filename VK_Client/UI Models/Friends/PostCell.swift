//
//  PostCell.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 15.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var postTextLabel: UITextView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeControl: LikeControl!
    @IBOutlet weak var commentControl: CommentControl!
    @IBOutlet weak var repostControl: RepostControl!
    @IBOutlet weak var viewsControl: ViewsControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
