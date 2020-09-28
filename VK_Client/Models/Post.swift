////
////  Post.swift
////  VK_Client
////
////  Created by Salavat Khalikov on 24.09.2020.
////  Copyright © 2020 Salavat Khalikov. All rights reserved.
////
//
//import Foundation
//
//// MARK: - NewsFeed
//struct NewsQuery: Codable {
//    let response: Response
//}
//
//// MARK: - Response
//struct Response: Codable {
//    let items: [ResponseItem]?
//    let nextFrom: String?
//
//    enum CodingKeys: String, CodingKey {
//        case items
//        case nextFrom = "next_from"
//    }
//}
//
//// MARK: - ResponseItem
//struct ResponseItem: Codable {
//    let sourceID, date: Int
//    let postID: Int?
//    let type: PostTypeEnum
//    let canDoubtCategory, canSetCategory: Bool?
//    let postType: PostTypeEnum?
//    let text: String?
//    let markedAsAds: Int?
//    let postSource: PostSource?
//    let comments: Comments?
//    let likes: PurpleLikes?
//    let reposts: FluffyReposts?
//    let views: Views?
//    let isFavorite: Bool?
//    let photos: Photos?
//    let signerID: Int?
//    let friends: Friends?
//
//
//    enum CodingKeys: String, CodingKey {
//        case sourceID = "source_id"
//        case date
//        case postID = "post_id"
//        case type
//        case canDoubtCategory = "can_doubt_category"
//        case canSetCategory = "can_set_category"
//        case postType = "post_type"
//        case text
//        case markedAsAds = "marked_as_ads"
//        case postSource = "post_source"
//        case comments, likes, reposts, views
//        case isFavorite = "is_favorite"
//        case photos
//        case signerID = "signer_id"
//        case friends
//    }
//}
//
//// MARK: - Link
//struct Link: Codable {
//    let url: String?
//    let title, linkDescription: String?
//    let target: String?
//    let photo: LinkPhoto?
//    let isFavorite: Bool?
//    let caption: String?
//
//    enum CodingKeys: String, CodingKey {
//        case url, title
//        case linkDescription = "description"
//        case target, photo
//        case isFavorite = "is_favorite"
//        case caption
//    }
//}
//
//// MARK: - LinkPhoto
//struct LinkPhoto: Codable {
//    let albumID, date, id, ownerID: Int?
//    let hasTags: Bool?
//    let sizes: [Size]?
//    let text: String?
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case date, id
//        case ownerID = "owner_id"
//        case hasTags = "has_tags"
//        case sizes, text
//    }
//}
//
//enum SizeType: String, Codable {
//    case a = "a"
//    case b = "b"
//    case c = "c"
//    case d = "d"
//    case e = "e"
//    case k = "k"
//    case l = "l"
//    case m = "m"
//    case o = "o"
//    case p = "p"
//    case q = "q"
//    case r = "r"
//    case s = "s"
//    case w = "w"
//    case x = "x"
//    case y = "y"
//    case z = "z"
//}
//
//// MARK: - AttachmentPhoto
//struct AttachmentPhoto: Codable {
//    let albumID, date, id, ownerID: Int?
//    let hasTags: Bool?
//    let accessKey: String?
//    let postID: Int?
//    let sizes: [Size]?
//    let text: String?
//    let userID: Int?
//    let lat, long: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case date, id
//        case ownerID = "owner_id"
//        case hasTags = "has_tags"
//        case accessKey = "access_key"
//        case postID = "post_id"
//        case sizes, text
//        case userID = "user_id"
//        case lat, long
//    }
//}
//
//enum AttachmentType: String, Codable {
//    case audio = "audio"
//    case link = "link"
//    case photo = "photo"
//    case video = "video"
//}
//
//// MARK: - Comments
//struct Comments: Codable {
//    let count, canPost: Int?
//    let groupsCanPost: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case canPost = "can_post"
//        case groupsCanPost = "groups_can_post"
//    }
//}
//
//// MARK: - Friends
//struct Friends: Codable {
//    let count: Int?
//    let items: [FriendsItem]?
//}
//
//// MARK: - FriendsItem
//struct FriendsItem: Codable {
//    let userID: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case userID = "user_id"
//    }
//}
//
//// MARK: - PurpleLikes
//struct PurpleLikes: Codable {
//    let count, userLikes, canLike, canPublish: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case userLikes = "user_likes"
//        case canLike = "can_like"
//        case canPublish = "can_publish"
//    }
//}
//
//// MARK: - Photos
//struct Photos: Codable {
//    let count: Int?
//    let items: [PhotosItem]?
//}
//
//// MARK: - PhotosItem
//struct PhotosItem: Codable {
//    let albumID, date, id, ownerID: Int?
//    let hasTags: Bool?
//    let accessKey: String?
//    let postID: Int?
//    let sizes: [Size]?
//    let text: String?
//    let userID: Int?
//    let likes: FluffyLikes?
//    let reposts: PurpleReposts?
//    let comments: Views?
//    let canComment, canRepost: Int?
//    let lat, long: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case date, id
//        case ownerID = "owner_id"
//        case hasTags = "has_tags"
//        case accessKey = "access_key"
//        case postID = "post_id"
//        case sizes, text
//        case userID = "user_id"
//        case likes, reposts, comments
//        case canComment = "can_comment"
//        case canRepost = "can_repost"
//        case lat, long
//    }
//}
//
//// MARK: - Views
//struct Views: Codable {
//    let count: Int?
//}
//
//// MARK: - FluffyLikes
//struct FluffyLikes: Codable {
//    let userLikes, count: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case userLikes = "user_likes"
//        case count
//    }
//}
//
//// MARK: - PurpleReposts
//struct PurpleReposts: Codable {
//    let count, userReposted: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case userReposted = "user_reposted"
//    }
//}
//
//// MARK: - PostSource
//struct PostSource: Codable {
//    let type: PostSourceType?
//    let platform: Platform?
//}
//
//enum Platform: String, Codable {
//    case android = "android"
//    case iphone = "iphone"
//}
//
//enum PostSourceType: String, Codable {
//    case api = "api"
//    case vk = "vk"
//}
//
//enum PostTypeEnum: String, Codable {
//    case audio = "audio"
//    case friend = "friend"
//    case post = "post"
//    case wallPhoto = "wall_photo"
//}
//
//// MARK: - FluffyReposts
//struct FluffyReposts: Codable {
//    let count, wallCount, mailCount, userReposted: Int
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case wallCount = "wall_count"
//        case mailCount = "mail_count"
//        case userReposted = "user_reposted"
//    }
//}
//
//// MARK: - Profile
//struct Profile: Codable {
//    let id: Int?
//    let firstName, lastName: String?
//    let isClosed, canAccessClosed: Bool?
//    let sex: Int?
//    let screenName: String?
//    let photo50, photo100: String?
//    let online: Int?
//    let onlineInfo: OnlineInfo?
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case isClosed = "is_closed"
//        case canAccessClosed = "can_access_closed"
//        case sex
//        case screenName = "screen_name"
//        case photo50 = "photo_50"
//        case photo100 = "photo_100"
//        case online
//        case onlineInfo = "online_info"
//    }
//}
//
//// MARK: - OnlineInfo
//struct OnlineInfo: Codable {
//    let visible, isOnline, isMobile: Bool?
//    let lastSeen, appID: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case visible
//        case isOnline = "is_online"
//        case isMobile = "is_mobile"
//        case lastSeen = "last_seen"
//        case appID = "app_id"
//    }
//}
