//
//  ParseGroupDataOperation.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 30.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import Foundation

class ParseGroupDataOperation: Operation {
    
    var output: [GroupItem]?
    
    override func main() {
        let getGroup = dependencies.first as? GetGroupOperation
        do {
            guard let data = getGroup?.data else { return }
            let groupQuery = try JSONDecoder().decode(GroupQuery.self, from: data)
            output = groupQuery.response.items
        } catch {
            print("PARSE GROUPS DATA OPERATION ERROR: \(error)")
        }
    }
}
