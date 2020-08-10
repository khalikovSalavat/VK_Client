//
//  FriendsViewController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 08.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, CAAnimationDelegate {
    
    var transferGroups: [Group]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedFriendID: String?
    var sections: [Character: [String]] = [:]
    var sectionsList = [String]()
    var filtered: [Character: [String]]?
    var filteredList = [String]()
    var sectionTitles = [Character]()
    var searchActive: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        sections = sectionizeFriendsList(friendsList: Array(friends.keys))
        sectionsList = friends.keys.compactMap { String($0) }
        sectionTitles = Array(sections.keys)

    }
    
    func sectionizeFriendsList (friendsList: [String]) -> [Character: [String]] {
        var sections = [Character: [String]]()
        
        for user in friendsList {
            let firstLetter = user.first!
            if sections[firstLetter] != nil {
                sections[firstLetter]?.append(user)
            }
            else {
                sections[firstLetter] = [user]
            }
        }
        return sections
    }

}


extension FriendsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if !searchActive {
            return sections.count
        } else {
            return 1
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles.compactMap { String($0) }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if !searchActive {
            return String(sectionTitles[section])
        } else { return nil}
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.text = ""
        searchBar.endEditing(true)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !searchActive {
            return sections[section].value.count
        } else {
            return filteredList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell") as? FriendCell
            else { fatalError() }
        if !searchActive {
            let key = sections[indexPath.section].value[indexPath.row]
            cell.nameLabel.text = friends[key]!.name + " " + friends[key]!.surname
            cell.avatarImage.image = UIImage(named: key)
            cell.friendID = key
            return cell
        } else {
            let key = filteredList[indexPath.row]
            cell.nameLabel.text = friends[key]!.name + " " + friends[key]!.surname
            cell.avatarImage.image = UIImage(named: key)
            cell.friendID = key
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFriendID = friends[indexPath.row].key
        guard let vc = storyboard?.instantiateViewController( identifier: "photoVC") as? PhotoViewController else { return }
        let cell = tableView.cellForRow(at: indexPath) as! FriendCell
        let avatar = cell.avatarImage
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.6, options: [], animations: {
            avatar?.transform = CGAffineTransform(scaleX: 0.65, y: 0.65)
            avatar?.transform = CGAffineTransform.identity
            
        }, completion: { (_) in
            self.navigationController?.pushViewController(vc, animated: true)
            selectedFriend = friends[indexPath.row].key
            self.transferGroups = friends[indexPath.row].value.groups
            self.searchBar.endEditing(true)
        } )
    }
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    }
}

extension FriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText != "" else {
            searchActive = false
            tableView.reloadData()
            return
        }
        searchActive = true
        filteredList = sectionsList.filter {$0.lowercased().prefix(searchText.count) == searchText.lowercased()}
        filtered = sectionizeFriendsList(friendsList: filteredList)
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

//extension FriendsViewController: UIViewControllerAnimatedTransitioning {
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        0.5
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        let containerViewFrame = transitionContext.containerView.frame
//
//        guard let source = transitionContext.viewController( forKey: .from) else { return }
//        guard let destination = transitionContext.viewController( forKey: .to) else { return }
//
//        transitionContext.containerView.addSubview(destination.view)
//        destination.view.frame = CGRect(x: containerViewFrame.width,
//                                        y: containerViewFrame.width * -1,
//                                        width: containerViewFrame.width,
//                                        height: containerViewFrame.height)
//        destination.view.transform = .init(rotationAngle: CGFloat.pi / 2)
//        UIView.animate(withDuration: 1, animations: {
//            destination.view.frame = containerViewFrame
//        }) { result in
//            source.removeFromParent()
//            transitionContext.completeTransition(true)
//
//    }
    
//    func animationEnded(_ transitionCompleted: Bool) {
//        <#code#>
//    }
    
//}

extension Dictionary {
    subscript(i: Int) -> (key: Key, value: Value) {
        get {
            return self[index(startIndex, offsetBy: i)]
        }
    }
}

