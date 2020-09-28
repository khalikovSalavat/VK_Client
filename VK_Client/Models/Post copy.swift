//
//  Post.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 24.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import Foundation

// MARK: - NewsFeed
struct NewsFeed: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let items: [ResponseItem]?
    let profiles: [Profile]?
    let groups: [Group]?
    let nextFrom: String?

    enum CodingKeys: String, CodingKey {
        case items, profiles, groups
        case nextFrom = "next_from"
    }
}

// MARK: - Group
struct Group: Codable {
    let id: Int
    let name, screenName: String
    let isClosed: Int
    let type: String
    let isAdmin, isMember, isAdvertiser: Int
    let photo50, photo100, photo200: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}

// MARK: - ResponseItem
struct ResponseItem: Codable {
    let sourceID, date: Int
    let audio: ItemAudio?
    let postID: Int?
    let type: PostTypeEnum
    let canDoubtCategory, canSetCategory: Bool?
    let postType: PostTypeEnum?
    let text: String?
    let markedAsAds: Int?
    let attachments: [Attachment]?
    let postSource: PostSource?
    let comments: Comments?
    let likes: PurpleLikes?
    let reposts: FluffyReposts?
    let views: Views?
    let isFavorite: Bool?
    let photos: Photos?
    let signerID: Int?
    let friends: Friends?

    enum CodingKeys: String, CodingKey {
        case sourceID = "source_id"
        case date, audio
        case postID = "post_id"
        case type
        case canDoubtCategory = "can_doubt_category"
        case canSetCategory = "can_set_category"
        case postType = "post_type"
        case text
        case markedAsAds = "marked_as_ads"
        case attachments
        case postSource = "post_source"
        case comments, likes, reposts, views
        case isFavorite = "is_favorite"
        case photos
        case signerID = "signer_id"
        case friends
    }
}

// MARK: - Attachment
struct Attachment: Codable {
    let type: AttachmentType
    let photo: AttachmentPhoto?
    let link: Link?
    let audio: AudioElement?
    let video: Video?
}

// MARK: - AudioElement
struct AudioElement: Codable {
    let artist: String
    let id, ownerID: Int
    let title: String
    let duration: Int
    let isExplicit, isFocusTrack: Bool
    let trackCode: String
    let url: String
    let date: Int
    let mainArtists: [MainArtist]?
    let shortVideosAllowed, storiesAllowed, storiesCoverAllowed: Bool
    let albumID, genreID, lyricsID: Int?

    enum CodingKeys: String, CodingKey {
        case artist, id
        case ownerID = "owner_id"
        case title, duration
        case isExplicit = "is_explicit"
        case isFocusTrack = "is_focus_track"
        case trackCode = "track_code"
        case url, date
        case mainArtists = "main_artists"
        case shortVideosAllowed = "short_videos_allowed"
        case storiesAllowed = "stories_allowed"
        case storiesCoverAllowed = "stories_cover_allowed"
        case albumID = "album_id"
        case genreID = "genre_id"
        case lyricsID = "lyrics_id"
    }
}

// MARK: - MainArtist
struct MainArtist: Codable {
    let name, domain, id: String
}

// MARK: - Link
struct Link: Codable {
    let url: String?
    let title, linkDescription: String?
    let target: String?
    let photo: LinkPhoto?
    let isFavorite: Bool?
    let caption: String?

    enum CodingKeys: String, CodingKey {
        case url, title
        case linkDescription = "description"
        case target, photo
        case isFavorite = "is_favorite"
        case caption
    }
}

// MARK: - LinkPhoto
struct LinkPhoto: Codable {
    let albumID, date, id, ownerID: Int?
    let hasTags: Bool?
    let sizes: [Size]?
    let text: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case sizes, text
    }
}

// MARK: - Size
//struct Size: Codable {
//    let height: Int
//    let url: String
//    let type: SizeType?
//    let width: Int
//    let withPadding: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case height, url, type, width
//        case withPadding = "with_padding"
//    }
//}

enum SizeType: String, Codable {
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
    case e = "e"
    case k = "k"
    case l = "l"
    case m = "m"
    case o = "o"
    case p = "p"
    case q = "q"
    case r = "r"
    case s = "s"
    case w = "w"
    case x = "x"
    case y = "y"
    case z = "z"
}

// MARK: - AttachmentPhoto
struct AttachmentPhoto: Codable {
    let albumID, date, id, ownerID: Int?
    let hasTags: Bool?
    let accessKey: String?
    let postID: Int?
    let sizes: [Size]?
    let text: String?
    let userID: Int?
    let lat, long: Double?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case accessKey = "access_key"
        case postID = "post_id"
        case sizes, text
        case userID = "user_id"
        case lat, long
    }
}

enum AttachmentType: String, Codable {
    case audio = "audio"
    case link = "link"
    case photo = "photo"
    case video = "video"
}

// MARK: - Video
struct Video: Codable {
    let accessKey: String?
    let canComment, canLike, canRepost, canSubscribe: Int?
    let canAddToFaves, canAdd, comments, date: Int?
    let videoDescription: String?
    let duration: Int?
    let image, firstFrame: [Size]?
    let width, height, id, ownerID: Int?
    let title: String?
    let isFavorite: Bool?
    let trackCode: String?
    let videoRepeat: Int?
    let type: AttachmentType?
    let views: Int?

    enum CodingKeys: String, CodingKey {
        case accessKey = "access_key"
        case canComment = "can_comment"
        case canLike = "can_like"
        case canRepost = "can_repost"
        case canSubscribe = "can_subscribe"
        case canAddToFaves = "can_add_to_faves"
        case canAdd = "can_add"
        case comments, date
        case videoDescription = "description"
        case duration, image
        case firstFrame = "first_frame"
        case width, height, id
        case ownerID = "owner_id"
        case title
        case isFavorite = "is_favorite"
        case trackCode = "track_code"
        case videoRepeat = "repeat"
        case type, views
    }
}

// MARK: - ItemAudio
struct ItemAudio: Codable {
    let count: Int?
    let items: [AudioElement]?
}

// MARK: - Comments
struct Comments: Codable {
    let count, canPost: Int?
    let groupsCanPost: Bool?

    enum CodingKeys: String, CodingKey {
        case count
        case canPost = "can_post"
        case groupsCanPost = "groups_can_post"
    }
}

// MARK: - Friends
struct Friends: Codable {
    let count: Int?
    let items: [FriendsItem]?
}

// MARK: - FriendsItem
struct FriendsItem: Codable {
    let userID: Int?

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
    }
}

// MARK: - PurpleLikes
struct PurpleLikes: Codable {
    let count, userLikes, canLike, canPublish: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case userLikes = "user_likes"
        case canLike = "can_like"
        case canPublish = "can_publish"
    }
}

// MARK: - Photos
struct Photos: Codable {
    let count: Int?
    let items: [PhotosItem]?
}

// MARK: - PhotosItem
struct PhotosItem: Codable {
    let albumID, date, id, ownerID: Int?
    let hasTags: Bool?
    let accessKey: String?
    let postID: Int?
    let sizes: [Size]?
    let text: String?
    let userID: Int?
    let likes: FluffyLikes?
    let reposts: PurpleReposts?
    let comments: Views?
    let canComment, canRepost: Int?
    let lat, long: Double?

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case accessKey = "access_key"
        case postID = "post_id"
        case sizes, text
        case userID = "user_id"
        case likes, reposts, comments
        case canComment = "can_comment"
        case canRepost = "can_repost"
        case lat, long
    }
}

// MARK: - Views
struct Views: Codable {
    let count: Int?
}

// MARK: - FluffyLikes
struct FluffyLikes: Codable {
    let userLikes, count: Int?

    enum CodingKeys: String, CodingKey {
        case userLikes = "user_likes"
        case count
    }
}

// MARK: - PurpleReposts
struct PurpleReposts: Codable {
    let count, userReposted: Int?

    enum CodingKeys: String, CodingKey {
        case count
        case userReposted = "user_reposted"
    }
}

// MARK: - PostSource
struct PostSource: Codable {
    let type: PostSourceType?
    let platform: Platform?
}

enum Platform: String, Codable {
    case android = "android"
    case iphone = "iphone"
}

enum PostSourceType: String, Codable {
    case api = "api"
    case vk = "vk"
}

enum PostTypeEnum: String, Codable {
    case audio = "audio"
    case friend = "friend"
    case post = "post"
    case wallPhoto = "wall_photo"
}

// MARK: - FluffyReposts
struct FluffyReposts: Codable {
    let count, wallCount, mailCount, userReposted: Int

    enum CodingKeys: String, CodingKey {
        case count
        case wallCount = "wall_count"
        case mailCount = "mail_count"
        case userReposted = "user_reposted"
    }
}

// MARK: - Profile
struct Profile: Codable {
    let id: Int?
    let firstName, lastName: String?
    let isClosed, canAccessClosed: Bool?
    let sex: Int?
    let screenName: String?
    let photo50, photo100: String?
    let online: Int?
    let onlineInfo: OnlineInfo?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case sex
        case screenName = "screen_name"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case online
        case onlineInfo = "online_info"
    }
}

// MARK: - OnlineInfo
struct OnlineInfo: Codable {
    let visible, isOnline, isMobile: Bool?
    let lastSeen, appID: Int?

    enum CodingKeys: String, CodingKey {
        case visible
        case isOnline = "is_online"
        case isMobile = "is_mobile"
        case lastSeen = "last_seen"
        case appID = "app_id"
    }
}
