//
//  TestViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 17.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
//    @IBOutlet weak var likeControl: LikeControl!
    
    var stackView = UIStackView()
    var stackView2 = UIStackView()
    var mainStackView = UIStackView()
    let heart = UIImageView()
    let counter = UILabel()
    let share = UIImageView()
    let shareCounter = UILabel()
    
    override func viewDidLoad() {
        
//        mainStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView2.translatesAutoresizingMaskIntoConstraints = false
//
//        counter.translatesAutoresizingMaskIntoConstraints = false
//        heart.translatesAutoresizingMaskIntoConstraints = false
//        share.translatesAutoresizingMaskIntoConstraints = false
//        shareCounter.translatesAutoresizingMaskIntoConstraints = false
//
//        mainStackView.spacing = 5
//        mainStackView.alignment = .center
//        mainStackView.axis = .horizontal
//
//        stackView.spacing = 5
//        stackView.alignment = .center
//        stackView.axis = .horizontal
//
//        stackView2.spacing = 5
//        stackView2.alignment = .center
//        stackView2.axis = .horizontal
//
//        heart.image = UIImage(systemName: "heart")
//        counter.text = "13"
//        share.image = UIImage(systemName: "heart.fill")
//        shareCounter.text = "7"
//
//        stackView = putTwoViewToStack(view1: heart, view2: counter)
//        stackView2 = putTwoViewToStack(view1: share, view2: shareCounter)
//
//        view.addSubview(mainStackView)
//        mainStackView.addArrangedSubview(stackView)
//        mainStackView.addArrangedSubview(stackView2)
//
//        [
//            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            mainStackView.widthAnchor.constraint(equalToConstant: view.frame.width - 20),
//            mainStackView.heightAnchor.constraint(equalToConstant: 20),
//            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ].forEach {$0.isActive = true }
    }
    
    func putTwoViewToStack( view1: UIView, view2: UIView) -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.axis = .horizontal

        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)

        [
            view1.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            view1.heightAnchor.constraint(equalToConstant: 20),
            view2.rightAnchor.constraint(equalTo: stackView.rightAnchor)
        ].forEach {$0.isActive = true }
        
        return stackView
    }
}
