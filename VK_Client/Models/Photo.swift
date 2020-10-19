//
//  Photo.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 18.08.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import RealmSwift

//public enum ImageType: String, Codable {
//    case s, m, x, o, p, q, r, y, z, w
//}

struct PhotoQuery: Codable {
    var response: PhotoResponse
}

struct PhotoResponse: Codable {
    var count: Int
    var items: [PhotoItem]
}

class PhotoItem: Object, Codable {
//    @objc dynamic var photoId = ""

    @objc dynamic var albumId: Int = 0
    @objc dynamic var date: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var ownerId: Int = 0
//    var lat = RealmOptional<Double>()
//    var long = RealmOptional<Double>()
//    @objc dynamic var postID = 0
    var sizes = List<Size>()
//    @objc dynamic var text: String = ""
//    @objc dynamic var likes: Likes? = nil
//    @objc dynamic var reposts: Reposts? = nil
    
    override class func primaryKey() -> String? {
        "id"
    }

    enum CodingKeys: String, CodingKey {
        case albumId = "album_id"
        case date, id
        case ownerId = "owner_id"
//        case lat, long
//        case postID = "post_id"
        case sizes//, text, likes, reposts
    }
}

class Size: Object, Codable {
    @objc dynamic var height: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var width: Int = 0
}

class Likes: Object, Codable {
    @objc dynamic var count = 0
    @objc dynamic var userLikes = 0

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

//class Reposts: Object, Codable {
//    @objc dynamic var count = 0
//}
