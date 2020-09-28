//
//  Post.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 22.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import Foundation


enum ListPostType: String, Codable { //not used
    case post
    case photo
    case photoTag = "photo_tag"
    case wallPhoto = "wall_photo"
    case friend
    case note
    case audio
    case video
}

enum PostType { //not used
    case post
    case copy
}

struct PostResponse {
    var items: [PostItem]
}

struct PostItem: Codable {
    var type: String = ""
    var sourceId: Int = 0
    var date: Double = 0
    var postType: String = ""
    var copyOwnerId: Int = 0
    var copyPostId: Int = 0
    var text: String = ""
    var comments: [CommentItem]
    var likes: LikeItem
    var reposts: RepostItem
//    var attachments: [T] //[AttachmentItem]
    var photos: [PhotoItem]
    var notes: [NoteItem]
    var friends: [UserItem]
    
    enum CodingKeys: String, CodingKey {
        case type
        case sourceId = "source_id"
        case date
        case postType = "post_type"
        case copyOwnerId = "copy_owner_id"
        case copyPostId = "copy_post_id"
        case text
        case comments
        case likes
        case reposts
//        case attachments
        case photos
        case notes
        case friends
    }
}

struct CommentItem: Codable {
    var count: Int = 0
    var canPost: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case count
        case canPost = "can_post"
    }
}

struct LikeItem: Codable {
    var count: Int = 0
    var userLikes: Int = 0
    var canLike: Int = 0
    var canPublish: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
        case canLike = "can_like"
        case canPublish = "can_publish"
    }
}

struct RepostItem: Codable {
    var count: Int = 0
    var userReposted: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }
}

//struct AttachmentItem: Codable {
//
//}

struct NoteItem: Codable {
    var id: Int = 0
    var ownerId: Int = 0
    var title: String = ""
    var text: String = ""
    
    enum CodingKeys: String, CodingKey {
        case id
        case ownerId = "owner_id"
        case title
        case text
    }
}
