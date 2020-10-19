//
//  PostCellControl.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 20.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit


class PostCellControl: UIStackView {
    
    var imageView = UIImageView()
    var countLabel = UILabel()
    var count = 0 {
        didSet {
            countLabel.text = "\(count)"
        }
    }
    var imageName: String = ""
    
    enum systemImageName: String {
        case active, notActive
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        countLabel.text = "\(count)"
        imageView.image = UIImage(systemName: imageName)
        
        [imageView, countLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        self.addArrangedSubview(imageView)
        self.addArrangedSubview(countLabel)
        
        configureStackView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(stackTapped))
        addGestureRecognizer(tapGesture)
    }
    
    
    @objc func stackTapped() {
        print(String(describing: self))
//        let cell = superview?.superview?.superview as? PostCell
    }
    
    
    func configureStackView() {
        self.axis = .horizontal
        self.distribution = .fill
        self.spacing = 5
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [
            self.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            countLabel.widthAnchor.constraint(equalToConstant: 20),
            ].forEach { $0.isActive = true }
    }
    
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
