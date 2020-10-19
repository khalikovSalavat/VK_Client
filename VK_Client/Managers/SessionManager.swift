//
//  SessionManager.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 12.08.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import Foundation
import Alamofire

enum VKMethodType: String {
    case photos
    case friends
    case groups
    case newsfeed
}


class SessionManager {
    static var shared = SessionManager()
    
    private init() {}
    private var parameters: Parameters = [
        "access_token" : Session.shared.token,
        "extended" : 1,
        "v" : "5.92",
    ]
    
    static let session: Alamofire.Session = {
        let configuration = Alamofire.URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        let session = Alamofire.Session(configuration: configuration)
        return session
    }()
    
    
    func getQueryParams( methodType: VKMethodType) -> Parameters {
        switch methodType {
        case .photos:
            return [
                "access_token" : Session.shared.token,
                "user_id" : Session.shared.userID,
                "v" : "5.77",
                "album_id" : "profile",
                "extended" : 1,
                "count" : 10,
            ]
        case .friends:
            return [
                "access_token" : Session.shared.token,
                "user_id" : Session.shared.userID,
                "v" : "5.92",
                "fields" : "id, first_name, last_name, photo_50, photo_100, online",
            ]
        case .groups:
            return [
                "access_token" : Session.shared.token,
                "user_id" : Session.shared.userID,
                "v" : "5.92",
                "fields" : "name",
                "extended" : 1,
            ]
        case .newsfeed:
            return [
                "access_token" : Session.shared.token,
                "start_time" : getUnixTime(subtractDays: 10)!,
                "v" : "5.111",//"5.21",
                "count" : 100,
                "filters" : "post, photo, wall_photo, note"
            ]
        }
    }
    
    
    func getUnixTime(subtractDays count: Int) -> String?  {
        let date = Calendar.current.date(byAdding: .day, value: -1 * count, to: Date())! as NSDate
        let unixTime = UInt(date.timeIntervalSince1970)
        return "\(unixTime)"
    }
    
    
    func loadData<T: Decodable>( token: String = Session.shared.token,
                   methodType: VKMethodType,
                   type: T.Type,
                   additionalParams: Parameters? = nil,
                   completion: ((Result<Any, Error>) -> Void)?) {
        
        let baseUrl = "https://api.vk.com"
        let path = "/method/" + methodType.rawValue + ".get"
        var params = getQueryParams(methodType: methodType)
        
        if let addParams = additionalParams {
            addParams.forEach { params[$0.key] = $0.value }
        }
        
//        if methodType == .photos {
//            SessionManager.session.request( baseUrl + path, method: .get, parameters: params).responseJSON(queue: DispatchQueue.global()) { response in
//                let json = response.value
//                print(json)
//            }
//        }
        
        SessionManager.session.request( baseUrl + path, method: .get, parameters: params).responseData(queue: DispatchQueue.global()) { response in
            guard let data = response.value else { return }
            do {
                let model = try JSONDecoder().decode(type.self, from: data)
                completion? (.success(model))
            } catch {
                completion? (.failure(error))
            }
        }
    }
    
    
    func addLike( ownerId: Int,
                  itemId: Int,
                  v: String = "5.124",
                  type: String = "post",
                  accessKey: String? = nil,
                  completion: ((Result<Any, Error>) -> Void)? = nil) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/likes.add"
        
        let params: Parameters = [
            "access_token" : Session.shared.token,
            "owner_id" : ownerId,
            "item_id" : itemId,
            "v" : "5.124",
            "type" : type,
        ]
        
        SessionManager.session.request( baseUrl + path, method: .post, parameters: params).responseData { response in
            guard let data = response.value else { return }
            do {
                let likesResponse = try JSONDecoder().decode([String : [String : Int]].self, from: data)
                let likesCount: Int = likesResponse["response"]?["likes"] ?? -1
                completion? (.success(likesCount))
            } catch {
                completion? (.failure(error))
            }
        }
        
    }
}
