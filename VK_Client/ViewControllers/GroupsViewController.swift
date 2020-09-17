//
//  GroupsViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 12.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit
import SDWebImage
import RealmSwift

class GroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButton: UIBarButtonItem!
    
    let realmManager = RealmManager.shared
    private var groups: Results<GroupItem>? {
        let groups: Results<GroupItem>? = realmManager?.getObjects()
        return groups?.sorted(byKeyPath: "name", ascending: true)
    }
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if let groups = groups, groups.isEmpty {
            loadGroups()
        }
        
        addGroupsObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadGroups()
    }
    
    func loadGroups() {
        SessionManager.shared.loadGroups(token: Session.shared.token, userId: Session.shared.userID) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(groups):
                let groupItems = groups.response.items
                DispatchQueue.main.async {
                    try? self.realmManager?.add(objects: groupItems)
                    self.tableView.reloadData()
                }
            case let .failure(error):
                print(error.localizedDescription)
                fatalError()
            }
        }
    }
    
    func addGroupsObserver() {
        token = groups?.observe { (changes: RealmCollectionChange) in
            switch changes {
            case .initial(let result):
//                print(result)
                break
            case .update(let result, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                print("results: \(result)\ndeletions:\(deletions)\ninsertions:\(insertions)\nmodifications:\(modifications)")
                break
            case .error(let error):
                print(error)
                break
            }
        }
    }
    
//    @IBAction func addGroup (_ sender: Any){
//        let alert = UIAlertController(title: "Добавить группу", message: nil, preferredStyle: .alert)
//        alert.addTextField { (textField) in
//            textField.placeholder = "Введите название группы"
//        }
//
//        let action = UIAlertAction(title: "OK", style: .default) { [weak self, weak alert] (action) in
//            guard let firstText = alert?.textFields?.first?.text else { return }
//            self?.addGroup(name: firstText)
//        }
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
//    }
    
//    private func addGroup(name: String) {
//        guard !name.isEmpty else { return }
//        groups.insert(Group(name: name), at: groups.count)
//        friends[selectedFriend!]?.groups.append(Group(name: name))
//        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
//    }
}

extension GroupsViewController: UITableViewDelegate {
}

extension GroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count: Int = groups?.count, groups?.count != 0 else {
            searchButton.isEnabled = false
            return 0
        }
        searchButton.isEnabled = true
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else { fatalError() }
        guard groups?.count != 0 else { return cell}
        let group = groups?[indexPath.row]
        cell.groupNameLabel.text = group?.name
        cell.icon.sd_setImage(with: URL(string: group?.photo100 ?? "" ), completed: nil)
        return cell
    }
    
//    @IBAction func openSearchGroupsViewController() {
//        guard let vc = storyboard?.instantiateViewController(identifier: "searchGroupsStoryBoard")
//            as? SearchGroupsViewController else { fatalError() }
//        vc.groups = groups
//
//    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            friends[selectedFriend!]?.groups.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
}
