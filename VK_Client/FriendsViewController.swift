//
//  FriendsViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 08.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

//var friends: [String : User] = [
//    "КиануРивз" : User(name: "Киану", surname: "Ривз", groups: [(Group(name: "Gr1", icon: UIImage(named: "groupIcon")!))]),
//    "КэрриМосс" : User(name: "Керри", surname: "Мосс", groups: [(Group(name: "Gr2", icon: UIImage(named: "groupIcon")!))]),
//    "ЛоуренсФишборн" : User(name: "Лоуренс", surname: "Фишборн", groups: [(Group(name: "Gr3", icon: UIImage(named: "groupIcon")!))]),
//]



class FriendsViewController: UIViewController {
    var transferGroups: [Group]?
    
    @IBOutlet weak var tableView: UITableView!
    
    var selectedFriendID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//
//        if segue.identifier == "photoSegue", let cell = sender as? FriendCell,
//            let destination = segue.destination as? PhotoViewController {
//            destination.image = cell.icon.image
//            selectedFriend = cell.friendID
//        }
//    }
}

extension FriendsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as? FriendCell else {fatalError()}
        cell.nameLabel.text = friends[indexPath.row].value.name + " " + friends[indexPath.row].value.surname
        
        cell.icon.image = UIImage(named: friends[indexPath.row].key)
        cell.friendID = friends[indexPath.row].key
        print("cell created at index: \(indexPath)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFriendID = friends[indexPath.row].key
        guard let vc = storyboard?.instantiateViewController( identifier: "photoVC") as? PhotoViewController else { return }
        vc.image = friends[indexPath.row].value.photo
        navigationController?.pushViewController(vc, animated: true)
        selectedFriend = friends[indexPath.row].key
        transferGroups = friends[indexPath.row].value.groups
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let vc = storyboard?.instantiateViewController(identifier: "photoVC") as? PhotoViewController else
//        { return }
//        vc.image = friends[indexPath.row].value.photo
//        let s = friends[indexPath.row].value.name
//        navigationController?.pushViewController(vc, animated: true)
//        vc.nameField.text! = s
//    }
    
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("selected row: \(indexPath.row)")
    }
}

extension Dictionary {
    subscript(i: Int) -> (key: Key, value: Value) {
        get {
            return self[index(startIndex, offsetBy: i)]
        }
    }
}

