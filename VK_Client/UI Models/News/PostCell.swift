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
    
    var likeControl: LikeControl!
    var commentControl: CommentControl!
    var stackView: UIStackView!
    var repostControl: RepostControl!
    var viewsControl: ViewsControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stackView = UIStackView()
        stackView.spacing = 10
        
        likeControl = LikeControl()
        commentControl = CommentControl()
        repostControl = RepostControl()
        viewsControl = ViewsControl()

        contentView.addSubview(stackView)

        
        stackView.addArrangedSubview(likeControl)
        stackView.addArrangedSubview(commentControl)
        stackView.addArrangedSubview(repostControl)
        stackView.addArrangedSubview(viewsControl)

        [
            stackView,
            likeControl,
            commentControl,
            repostControl,
            viewsControl,
            ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false}
        
        [
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20), //не могу привязать к нижней части postImageView, выдает ошибку
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 20),
            ].forEach { $0.isActive = true }
        
    }
}
