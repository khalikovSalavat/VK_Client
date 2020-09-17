//
//  SearchGroupsViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 14.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

//class SearchGroupsViewController: UIViewController {
//    @IBOutlet weak var tableView: UITableView!
//
//    var groupsList: [Group]?
//    var groups: [group]?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.delegate = self
//        tableView.dataSource = self
//
//        guard selectedFriend != nil else {
//            return
//        }
//        groupsList = remainingGroups(friendID: selectedFriend!, allGroups: groups)
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//    }
    
//    private func remainingGroups (friendID: String, allGroups: [Group]) -> [Group]? {
//        guard groups != nil else { return nil }
//        var tempArr: [Group] = []
//
//        for case let gr in (groups)! {
//            if !(friends[selectedFriend!]?.groups.contains(gr))! {
//                tempArr.append(gr)
//            }
//        }
//        return tempArr
//    }
    
//    private func addGroup (friendID: String?, indPath: IndexPath) {
//        if let gr = groupsList?[indPath.row] {
//            friends[friendID!]!.groups.append(gr)
//            tableView.deleteRows(at: [indPath], with: .fade)
//            groupsList?.remove(at: indPath.row)
////            tableView.reloadData()
//        } else {
//            return
//        }
//    }
//}

//extension SearchGroupsViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    }
//}
//
//extension SearchGroupsViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard selectedFriend != nil else { return 0 }
//        let count = groups?.count ?? 0
//        return count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else { fatalError() }
//        cell.groupNameLabel.text = groupsList?[indexPath.row].name
//        cell.icon.image = UIImage(named: "groupIcon")
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let addAction = UIContextualAction(style: .normal, title: "Add", handler: {(ac:UIContextualAction, view: UIView, success:(Bool) -> Void) in
//            success(true)
//            self.addGroup(friendID: selectedFriend!, indPath: indexPath)
//            tableView.reloadData()
//        })
//        addAction.backgroundColor = .lightGray
//        return UISwipeActionsConfiguration(actions: [addAction])
//    }
    
//}
