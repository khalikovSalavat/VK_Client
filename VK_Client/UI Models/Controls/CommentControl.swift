//
//  CommentControl.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 26.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class CommentControl: UIControl {
    var count: Int = 0
    private var stackView = UIStackView()
    private let imageView = UIImageView()
    private let countLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        stackView = putTwoViewToStack(view1: imageView, view2: countLabel, stackOrientation: .toLeft)
        
        imageView.image = UIImage(systemName: "bubble.left")
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
    }
}
