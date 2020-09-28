//
//  NewsViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 15.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit
import SDWebImage

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var news = NewsResponse(items: nil, profiles: nil, groups: nil, nextFrom: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadNews()
    }
    
    func loadNews() {
        var params = [String : String]()
        if let start = self.news.nextFrom {
            params = ["start_from" : start]
        }
        SessionManager.shared.loadData(methodType: .newsfeed, type: NewsfeedQuery.self, additionalParams: params) {
            [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(newsQuery):
                let news = (newsQuery as! NewsfeedQuery).response
                self.news = news
                self.tableView.reloadData()
            case let .failure(error):
                print(error)
            }
        }
        
//        SessionManager.shared.loadNewsFeed(token: Session.shared.token) { result in
//            switch result {
//            case let .success(news):
//                print(news)
//                break
//            case let .failure(error):
//                print(error)
//                break
//            }
//        }
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(news.items?.count)
        return news.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        
        guard let newsfeed = news.items,
            let friends = news.profiles,
            let groups = news.groups else { return cell }
        let currentNews = newsfeed[indexPath.row]
        
        let name: String
        let avatarURL: URL
        if currentNews.sourceID! > 0 {
            let profile = friends.first { $0.id == currentNews.sourceID }
            name = (profile?.firstName)! + " " + (profile?.lastName)!
            avatarURL = URL(string: (profile?.photo100)!)!
        } else {
            let group = groups.first { $0.id == Int(currentNews.sourceID! * -1)}
            name = group?.name as? String ?? ""
            avatarURL = URL(string: (group?.screenName)!)!
        }
        let date = Date(timeIntervalSince1970: Double(currentNews.date!)).description
        
        cell.authorNameLabel.text = name
        cell.postDateLabel.text = date
        cell.postTextLabel.text = currentNews.text
        cell.avatarImageView.sd_setImage( with: avatarURL)
        
        cell.likeControl.count = (currentNews.likes?.count)!
        cell.likeControl.isActive = currentNews.likes?.userLikes == 1 ? true : false
        cell.commentControl.count = (currentNews.comments?.count)!
        cell.repostControl.count = (currentNews.reposts?.count)!
        cell.viewsControl.count = (currentNews.reposts?.count)!
        

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 250
//    }
}
