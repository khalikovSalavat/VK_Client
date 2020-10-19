//
//  ReloadGroupTableController.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 30.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import Foundation

class ReloadGroupTableController: Operation {
    
    let controller: GroupsViewController
    
    
    init(controller: GroupsViewController) {
        self.controller = controller
    }
    
    override func main() {
        let realmManager = RealmManager.shared
        guard let parseGroupDataOperation = dependencies.first as? ParseGroupDataOperation else { return }
        
        if let groups = parseGroupDataOperation.output {
            try? realmManager?.add(objects: groups)
            controller.tableView.reloadData()
        }
    }
}
