//
//  ShareControl.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 26.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class ShareControl: UIControl {
    
    var imageView: UIImageView! = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.image = UIImage(systemName: "square.and.arrow.up")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        [
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor)
        ].forEach { $0.isActive = true }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onShareTapped(_:)))
        addGestureRecognizer(gesture)
    }
    
    @objc func onShareTapped (_ gesture: UIGestureRecognizer) {
        print("share button tapped")
        sendActions(for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
