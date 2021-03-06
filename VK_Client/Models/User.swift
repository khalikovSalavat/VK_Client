//
//  User2.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 17.08.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import RealmSwift

var selectedFriendId: Int?

struct UserQuery: Codable {
    var response: UserResponse
}

struct UserResponse: Codable {
    let count: Int
    var items: [UserItem]
}

class UserItem: Object, Codable {
    
    @objc dynamic var id = 0
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var photo50 = ""
    @objc dynamic var photo100 = ""
    @objc dynamic var online = 0
    @objc dynamic var deactivated: String? = ""
    
    override class func primaryKey() -> String? {
        "id"
    }

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case online
        case deactivated
    }
}
