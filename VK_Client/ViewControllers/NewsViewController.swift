//
//  NewsViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 15.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

//Болванка для объекта типа Post
struct Post {
    let author: String
    let date: String
    let postText: String
}

//Временный массив для заполнения таблицы
var array: [Post] {
    var array = [Post]()
    for i in (0...2) {
        array.append(Post(author: "author-\(i)", date: "date-\(i)", postText: "post text \(i)"))
    }
    return array
}


class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var stackView = UIStackView()
//    var likeControl = LikeControl()
//    var commentControl = CommentControl()
//    var repostControl = RepostControl()
//    var viewsControl = ViewsControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        view.addSubview(stackView)
//
//        [
//            stackView, likeControl, commentControl, repostControl, viewsControl
//            ].forEach {$0.translatesAutoresizingMaskIntoConstraints = false }
//
//        [
//            stackView.leftAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20),
//            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
//            stackView.heightAnchor.constraint(equalToConstant: 20),
//            ].forEach { $0.isActive = true }
//
//        stackView.addArrangedSubview(likeControl)
//        stackView.addArrangedSubview(commentControl)
//        stackView.addArrangedSubview(repostControl)
//        stackView.addArrangedSubview(viewsControl)
//        
//        stackView.axis = .horizontal
//        stackView.spacing = 10
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let el = array[indexPath.row]
        cell.authorNameLabel.text = el.author
        cell.postDateLabel.text = el.date
        cell.postTextLabel.text = el.postText
        print(array.count)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
