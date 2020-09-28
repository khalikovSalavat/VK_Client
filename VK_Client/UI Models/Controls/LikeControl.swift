//
//  Like.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 20.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit


class LikeControl: PostCellControl {
    
    enum systemImageName: String {
        case active, notActive
    }
    
    var imageNames: [systemImageName : String] = [:]
    var isActive: Bool = false{
        didSet {
            let name = isActive ? imageNames[.active] : imageNames[.notActive]
            imageView.image = UIImage(systemName: name ?? "ant")
        }
    }
    
    override func awakeFromNib() {
        
        imageNames[.active] = "heart.fill"
        imageNames[.notActive] = "heart"
        
        super.awakeFromNib()
        
    }

    override func stackTapped() {
        super.stackTapped()
        
        isActive = !isActive
    }
    
    func animateImage(view: UIView) {
        let animation = CASpringAnimation(keyPath: "position.y")
        animation.fromValue = view.layer.position.y
        animation.toValue = view.layer.position.y - 5
        animation.damping = 0.5
        animation.stiffness = 100
        animation.mass = 0.2
        animation.duration = 0.5
        view.layer.add(animation, forKey: nil)
    }
}
