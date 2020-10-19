//
//  LoadingAnimation.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 28.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class LoadingAnimation: UIView {
    private var circle = UIView()
    private var radius: CGFloat = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCircle()
        animateCircle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func animateCircle() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse], animations: {
            self.circle.layer.opacity = 1
        }, completion: { (_) in
            self.circle.frame.origin.x += self.radius
            self.circle.layer.opacity = 0
            UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse], animations: {
                self.circle.layer.opacity = 1
            }, completion: { (_) in
                self.circle.frame.origin.x += self.radius
                self.circle.layer.opacity = 0
                UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse], animations: {
                    self.circle.layer.opacity = 1
                }, completion: { (_) in
                    self.circle.layer.opacity = 0
                })
            })
        })
    }
    
    func initCircle () {
        self.frame = CGRect(x: 0, y: 0, width: 100 , height: 30)
        radius = super.frame.width / 5
        circle.frame = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        circle.layer.cornerRadius = radius / 2
        circle.backgroundColor = UIColor.white
        circle.layer.opacity = 0
        addSubview(circle)
        
        circle.translatesAutoresizingMaskIntoConstraints = false
        [
        circle.leftAnchor.constraint(equalTo: leftAnchor),
        circle.topAnchor.constraint(equalTo: topAnchor),
        circle.heightAnchor.constraint(equalToConstant: radius),
        circle.widthAnchor.constraint(equalToConstant: radius),
        ].forEach { $0.isActive = true }
    }
}
