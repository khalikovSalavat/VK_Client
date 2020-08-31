//
//  Photo.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 18.08.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import RealmSwift

public enum ImageType: String, Codable {
    case s, m, x, o, p, q, r, y, z, w
}

struct PhotoQuery: Codable {
    let response: PhotoResponse
    
    static func getURLsBySize (photosQuery: PhotoQuery, size: ImageType) -> [String] {
            photosQuery.response.items.map {
                var result = ""
                for eachSize in $0.sizes {
                    if eachSize.type == size {
                        result = eachSize.url
                    }
                }
                return result
            }
        }
}

struct PhotoResponse: Codable {
    let count: Int
    let items: [PhotoItem]
}

class PhotoItem: Object, Codable {
    @objc dynamic let albumID = 0
    @objc dynamic let date = 0
    @objc dynamic let id = 0
    @objc dynamic let ownerID = 0
    @objc dynamic let hasTags = false
    @objc dynamic let lat: Double = 0.0
    @objc dynamic let long: Double = 0.0
    @objc dynamic let postID = 0
    var sizes = List<Size>()
    @objc dynamic let text: String = ""
    @objc dynamic var likes: Likes? = nil
    @objc dynamic let reposts: Reposts? = nil

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case lat, long
        case postID = "post_id"
        case sizes, text, likes, reposts
    }
}

class Likes: Object, Codable {
    @objc dynamic let count = 0
    @objc dynamic let userLikes = 0

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

class Reposts: Object, Codable {
    @objc dynamic let count = 0
}

struct Size: Codable, RealmCollectionValue {
    let height = 0
    let url = ""
    let type: ImageType
    let width = 0
}


//struct PhotoResponse: Codable {
//    let response: Response
//
//    struct Response: Codable {
//        let count: Int
//        let items: [PhotoItems]
//
//        struct PhotoItems: Codable {
//            let id: Int
//            let albumId: Int
//            let ownerId: Int
//            let sizes: [String : Sizes]
//            let likes: Likes
//
//            private enum CodingKeys: String, CodingKey {
//                case id
//                case albumId = "album_id"
//                case ownerId = "owner_id"
//                case sizes
//                case likes
//            }
//
//            struct Likes: Codable {
//                var userLikes: Int
//                var count: Int
//
//                enum CodingKeys: String, CodingKey {
//                    case userLikes = "user_likes"
//                    case count
//                }
//            }
//
//            struct Sizes: Codable {
//                let src: String
//                let width: Int
//                let height: Int
//                let type: ImageType
//            }
//        }
//    }
//
//    static func getURLsBySize (photosResonse: PhotoResponse, size: ImageType) -> [String] {
//        photosResonse.response.items.map {
//            var result = ""
//            for eachSize in $0.sizes {
//                if eachSize.value.type == size {
//                    result = eachSize.value.src
//                }
//            }
//            return result
//        }
//    }
//}
