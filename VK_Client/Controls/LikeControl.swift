//
//  LikeControl.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 21.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class LikeControl: UIControl {

    var count: Int = 0
    private let imageView = UIImageView()
    private let countLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(imageView)
        addSubview(countLabel)

        let imageViewConstaints = [
            imageView.rightAnchor.constraint(equalTo: countLabel.leftAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalTo: heightAnchor)
        ]

        let labelConstraints = [
            countLabel.rightAnchor.constraint(equalTo: rightAnchor),
            countLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]

        NSLayoutConstraint.activate(imageViewConstaints + labelConstraints )

        let gesture = UITapGestureRecognizer(target: self, action: #selector(onHeartTapped(_:)))
        addGestureRecognizer(gesture)
        updateView()
    }

    @objc func onHeartTapped (_ gesture: UIGestureRecognizer) {
        isSelected = !isSelected
        count += isSelected ? +1 : -1
        updateView()
        animateHeart(view: imageView)
        sendActions(for: .valueChanged)
        print("HEART TAPPED")
    }
    
    func animateHeart(view: UIView) {
        let animation = CASpringAnimation(keyPath: "position.y")
        animation.fromValue = view.layer.position.y
        animation.toValue = view.layer.position.y - 5
        animation.damping = 0.5
        animation.stiffness = 100
        animation.mass = 0.2
        animation.duration = 0.5
        view.layer.add(animation, forKey: nil)
    }

    func updateView () {
        countLabel.text = "\(count)"
        if isSelected {
            imageView.image = UIImage(systemName: "heart.fill")
        } else {
            imageView.image = UIImage(systemName: "heart")
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
