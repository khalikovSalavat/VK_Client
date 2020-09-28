//
//  NewsCell.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 25.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class NewsCell_old: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var publishTimeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsText: UITextView!
    @IBOutlet weak var imgView: UIImageView!
    
//    let likeControl = LikeControl()
//    let commentControl = CommentControl()
//    let shareControl = RepostControl()
//    let numberOfViews = NumberOfViews()
//    let loadIndicator = LoadIndicator()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.cornerRadius = avatar.frame.width / 2
        
        newsText.isEditable = true
        newsText.isEditable = false
        newsText.isScrollEnabled = false
        
//        configureElements()
    }
    
//    func configureElements () {
//
//        addSubview(likeControl)
//        addSubview(commentControl)
//        addSubview(shareControl)
//        addSubview(numberOfViews)
//        addSubview(loadIndicator)
        
//        likeControl.translatesAutoresizingMaskIntoConstraints = false
//        commentControl.translatesAutoresizingMaskIntoConstraints = false
//        shareControl.translatesAutoresizingMaskIntoConstraints = false
//        numberOfViews.translatesAutoresizingMaskIntoConstraints = false
//        loadIndicator.translatesAutoresizingMaskIntoConstraints = false
        
//        [
//            likeControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
//            likeControl.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 40),
//            likeControl.widthAnchor.constraint(equalToConstant: 40),
//            likeControl.heightAnchor.constraint(equalToConstant: 20)
//        ].forEach { $0.isActive = true }
        
//        [
//            commentControl.leftAnchor.constraint(equalTo: likeControl.rightAnchor, constant: 40),
//            commentControl.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 40),
//            commentControl.widthAnchor.constraint(equalToConstant: 20),
//            commentControl.heightAnchor.constraint(equalToConstant: 20),
//        ].forEach { $0.isActive = true }
            
//        [
//            shareControl.leftAnchor.constraint(equalTo: commentControl.rightAnchor, constant: 40),
//            shareControl.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 40),
//            shareControl.widthAnchor.constraint(equalToConstant: 20),
//            shareControl.heightAnchor.constraint(equalToConstant: 20),
//        ].forEach { $0.isActive = true }
        
//        [
//            numberOfViews.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
//            numberOfViews.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 40),
//            numberOfViews.widthAnchor.constraint(equalToConstant: 50),
//            numberOfViews.heightAnchor.constraint(equalToConstant: 20),
//        ].forEach { $0.isActive = true }
        
//        [
//            loadIndicator.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
//            loadIndicator.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: 40),
//            loadIndicator.widthAnchor.constraint(equalToConstant: 10),
//            loadIndicator.heightAnchor.constraint(equalToConstant: 10),
//        ].forEach { $0.isActive = true }
        
//
//    }
}
