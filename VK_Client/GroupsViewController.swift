//
//  GroupsViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 12.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class GroupsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groupsToShow: [Group]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print("GroupsViewController viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        friends[selectedFriend!]?.groups.sort { $0.name < $1.name }
        tableView.reloadData()
        print("GroupsViewController viewWillAppear")
    }
    
    @IBAction func addGroup (_ sender: Any){
        let alert = UIAlertController(title: "Добавить группу", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Введите название группы"
        }
        
        let action = UIAlertAction(title: "OK", style: .default) { [weak self, weak alert] (action) in
            guard let firstText = alert?.textFields?.first?.text else { return }
            self?.addGroup(name: firstText)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func addGroup(name: String) {
        guard !name.isEmpty else { return }
        groups.insert(Group(name: name), at: groups.count)
        friends[selectedFriend!]?.groups.append(Group(name: name))
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
//        tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
}

extension GroupsViewController: UITableViewDelegate {
    
}

extension GroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let selected: String = selectedFriend, let count: Int = friends[selected]?.groups.count else
        { return 0 }
//        print(count)
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else { fatalError() }
//        guard selectedFriend != nil else {
//            cell.groupNameLabel.text = ""
//            return cell
//        }
        cell.groupNameLabel.text = friends[selectedFriend!]!.groups[indexPath.row].name
        cell.icon.image = UIImage(named: "groupIcon")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            friends[selectedFriend!]?.groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
