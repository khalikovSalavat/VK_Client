//
//  Group2.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 19.08.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import RealmSwift

struct GroupQuery: Codable {
    var response: GroupResponse
}

struct GroupResponse: Codable {
    var count: Int
    var items: [GroupItem]
}

class GroupItem: Object, Codable {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var screenName = ""
//    @objc dynamic let isClosed = 0
    @objc dynamic var type = ""
    @objc dynamic var isAdmin = 0
    @objc dynamic var isMember = 0
    @objc dynamic var isAdvertiser = 0
    @objc dynamic var photo50 = ""
    @objc dynamic var photo100 = ""
    @objc dynamic var photo200 = ""
    
    override class func primaryKey() -> String? {
        "id"
    }

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
//        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}
