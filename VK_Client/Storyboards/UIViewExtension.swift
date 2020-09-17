//
//  UIViewExtension.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 17.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

extension UIView {
    
    public enum StackElementsOrientation {
        case toLeft, toOpposite
    }
    
    public func putTwoViewToStack( view1: UIView, view2: UIView, stackOrientation: StackElementsOrientation, spacing: Int = 20) -> UIStackView {
        
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        
        switch stackOrientation {
        case .toLeft:
            [
                view1.leftAnchor.constraint(equalTo: stackView.leftAnchor),
                view2.rightAnchor.constraint(equalTo: view1.leftAnchor)
                ].forEach {$0.isActive = true }
        case .toOpposite:
            [
                view1.leftAnchor.constraint(equalTo: stackView.leftAnchor),
                view2.rightAnchor.constraint(equalTo: stackView.rightAnchor)
                ].forEach {$0.isActive = true }
        }
        
        return stackView
    }
}
