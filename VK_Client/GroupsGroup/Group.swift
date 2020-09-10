//
//  Group.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 14.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

struct Group: Equatable {
    let name: String
    let icon: UIImage?// = UIImage(named: "groupIcon")
    
    init(name: String, icon: UIImage = UIImage(named: "groupIcon")!) {
        self.name = name
        self.icon = icon
    }
    
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }
}

var groups: [Group] = [
    Group(name: "Gr1"),
    Group(name: "Gr2"),
    Group(name: "Gr3"),
    Group(name: "Gr4"),
    Group(name: "Gr5"),
    Group(name: "Gr6"),
    Group(name: "Gr7"),
    Group(name: "Gr8"),
    Group(name: "Gr9"),
    Group(name: "Gr10"),
]


