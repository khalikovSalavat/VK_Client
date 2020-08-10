//
//  NumberOfViews.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 26.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class NumberOfViews: UIControl {
    
    var count: Int = 0
    var imageView: UIImageView!
    var countLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        countLabel = UILabel()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(systemName: "eye.fill")
        countLabel.text = String(15)//String(count)
        
        addSubview(imageView)
        addSubview(countLabel)
        
        [
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            ].forEach { $0.isActive = true }
        
        [
            countLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10),
//            countLabel.rightAnchor.constraint(equalTo: rightAnchor),
            countLabel.topAnchor.constraint(equalTo: topAnchor),
            countLabel.widthAnchor.constraint(equalToConstant: 20),
            ].forEach { $0.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
