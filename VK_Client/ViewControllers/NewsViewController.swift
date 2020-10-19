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
    
    @IBOutlet private weak var tableView: UITableView!
    var news = NewsResponse(items: nil, profiles: nil, groups: nil, nextFrom: nil) {
        didSet {
            DispatchQueue.global().async(group: dispatchGroup) {
                guard let profiles = self.news.profiles,
                    let groups = self.news.groups,
                    let items = self.news.items else { return }
                self.profiles = profiles
                self.groups = groups
                self.items = items
            }
            
            dispatchGroup.notify(queue: .main) {
                self.tableView.reloadData()
            }
        }
    }
    
    let dispatchGroup = DispatchGroup()
    var profiles: [Profile] = []
    var groups: [Group] = []
    var items: [ResponseItem] = []
    var photoService: PhotoService?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        photoService = PhotoService(container: tableView)
        
        loadNews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
                self.news = news!
                DispatchQueue.main.async{
                    self.tableView.reloadData()
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}


extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.items?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let currentNews = items[indexPath.row] //as! ResponseItem
        let name: String?
        let avatarURL: URL
        
        if currentNews.sourceID! > 0 {
            let profile = profiles.first { $0.id == currentNews.sourceID }
            name = (profile?.firstName)! + " " + (profile?.lastName)!
            avatarURL = URL(string: (profile?.photo100)!)!
        } else {
            let group = groups.first { $0.id == Int(currentNews.sourceID! * -1)}
            name = group?.name
            avatarURL = URL(string: (group?.photo100)!)!
        }
        let date = Date(timeIntervalSince1970: Double(currentNews.date!)).description
        let firstNewsPhoto = currentNews.attachments?.filter { $0.type == .photo }.first
        if let photoURL = URL(string: firstNewsPhoto?.photo?.sizes?.last?.url ?? "") {
            cell.postImageView.image = photoService?.getPhoto(atIndexPath: indexPath, byURL: "\(photoURL)")
        }
        
        cell.authorNameLabel.text = name
        cell.postDateLabel.text = date
        cell.postTextLabel.text = currentNews.text
        cell.avatarImageView.sd_setImage( with: avatarURL)
        
        cell.likeControl.count = (currentNews.likes?.count) ?? 0
        cell.likeControl.isActive = currentNews.likes?.userLikes == 1 ? true : false
        cell.commentControl.count = (currentNews.comments?.count) ?? 0
        cell.repostControl.count = (currentNews.reposts?.count) ?? 0
        cell.viewsControl.count = (currentNews.reposts?.count) ?? 0
        
        return cell
    }
}
