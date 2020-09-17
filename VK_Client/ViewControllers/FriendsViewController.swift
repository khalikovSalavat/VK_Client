//
//  FriendsViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 08.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit
import RealmSwift

class FriendsViewController: UIViewController, CAAnimationDelegate, UITableViewDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    
    var realmManager = RealmManager.shared
    var searchController = UISearchController(searchResultsController: nil)
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Обновление...",
                                                            attributes: [.font: UIFont.systemFont(ofSize: 15)])
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    var sections: [Character: [UserItem]]? {
        guard let friends = self.friends else { return nil }
        return sectionize(friends: Array(friends))
    }
    
    var sectionTitles: [Character]? {
        guard let sections = self.sections else { return nil }
        let arr: [Character] = Array(self.sections!.keys)
        return arr.sorted { $0 < $1 }
    }
    
    private var friends: Results<UserItem>? {
        guard let friends: Results<UserItem>? = realmManager?.getObjects() else { return nil}
        return friends?.sorted(byKeyPath: "lastName", ascending: true)
    }
    private var filteredFriends: Results<UserItem>? {
        guard searchText != "" else { return friends }
        return friends?.filter("firstName CONTAINS[cd] %@", searchText)
    }
    
    var token: NotificationToken?
    var searchActive: Bool = false
    var searchText: String {
        searchController.searchBar.text ?? ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.refreshControl = refreshControl
        
        searchController.searchResultsUpdater = self
        tableView.tableHeaderView = searchController.searchBar
        
        if let friends = friends, friends.isEmpty {
            loadFriends()
        }
        addFriendsObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadFriends()
    }
    
    deinit {
        token?.invalidate()
    }
    
    func loadFriends() {
        SessionManager.shared.loadFriends(token: Session.shared.token, userId: Session.shared.userID) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(users):
                let userItems = users.response.items
                DispatchQueue.main.async {
                    try? self.realmManager?.add(objects: userItems)
                    self.tableView.reloadData()
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func sectionize( friends: [UserItem]) -> [Character : [UserItem]] {
        var sections: [Character : [UserItem]] = [:]
        for friend in friends {
            let first = friend.lastName.first ?? " "
            if sections[first] == nil {
                sections[first] = [friend]
            } else {
                sections[first]?.append(friend)
            }
        }
        return sections
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text == "" {
            searchActive = false
            self.tableView.reloadData()
        } else {
            searchActive = true
            self.tableView.reloadData()
        }
    }
    
    @objc private func refresh(_ sender: UIRefreshControl) {
        try? realmManager?.deleteAll()
        loadFriends()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func addFriendsObserver() {
        token = friends?.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial(let results):
//                print(results)
                return
            case .update(let results, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                print("results: \(results)\ndeletions:\(deletions)\ninsertions:\(insertions)\nmodifications:\(modifications)")
                self?.loadFriends()
                return
            case .error(let error):
                print(error)
                return
            }
        }
    }
}


extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard !searchActive, sectionTitles?.count != 0 else { return nil }
        let title = sectionTitles?[section]
        return "\(title!)"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard friends?.count != 0, searchText == "" else { return 0 }
        return (sections?[(sectionTitles?[section])!]!.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard friends?.count != 0, searchText == "" else { return 0 }
        return sectionTitles!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as? FriendCell
            else { fatalError() }
        guard friends?.count != 0  else { return cell }
        if searchText == "" {
            let user = sections![sectionTitles![indexPath.section]]![indexPath.row]
            cell.nameLabel.text = user.firstName + " " + user.lastName
            let urlString = user.photo100
            let url: URL = URL(string: urlString)!
            cell.avatarImage.sd_setImage(with: url, completed: nil)
            return cell
        } else {
            let user = filteredFriends![indexPath.row]
            cell.nameLabel.text = user.firstName + " " + user.lastName
            let urlString = user.photo100
            let url: URL = URL(string: urlString)!
            cell.avatarImage.sd_setImage(with: url, completed: nil)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        selectedFriendId = sections![sectionTitles![indexPath.section]]![indexPath.row].id
        guard let vc = storyboard?.instantiateViewController( identifier: "photoStoryBoard") as? PhotoViewController else { return }
        if searchText == "" {
            vc.userId = sections![sectionTitles![indexPath.section]]?[indexPath.row].id as! Int
        } else {
            vc.userId = filteredFriends?[indexPath.row].id as! Int
        }
        
//        let cell = tableView.cellForRow(at: indexPath) as! FriendCell
//        let avatar = cell.avatarImage
        
//        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.6, options: [], animations: {
//            avatar?.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
//            avatar?.transform = CGAffineTransform.identity
//
//        }, completion: { (_) in
//            self.navigationController?.pushViewController(vc, animated: true)
//        } )
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
