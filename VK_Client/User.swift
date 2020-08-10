//
//  User.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 14.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let surname: String
    var photo: UIImage!
    var groups: [Group]
    
    init(name: String, surname: String, groups: [Group]) {
        self.name = name
        self.surname = surname
        self.groups = groups
        self.photo = UIImage(named: self.name + self.surname)
    }
}

var friends: [String : User] = [
    "КиануРивз" : User(name: "Киану", surname: "Ривз", groups: [(Group(name: "Gr1", icon: UIImage(named: "groupIcon")!))]),
    "КэрриМосс" : User(name: "Кэрри", surname: "Мосс", groups: [(Group(name: "Gr2", icon: UIImage(named: "groupIcon")!))]),
    "ЛоуренсФишборн" : User(name: "Лоуренс", surname: "Фишборн", groups: [(Group(name: "Gr3", icon: UIImage(named: "groupIcon")!))]),
]
