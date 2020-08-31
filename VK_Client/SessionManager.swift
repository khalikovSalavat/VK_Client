//
//  SessionManager.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 12.08.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import Foundation
import Alamofire

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
    
    func loadPhotos( token: String, userId: Int,
                     completion: ((Result<PhotoQuery, Error>) -> Void)?) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.get"
        
        var params = parameters
        params["user_id"] = Session.shared.userID
        params["fields"] = "id, first_name, last_name, photo_100, online"
        
        SessionManager.session.request(baseUrl + path, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return }
            do {
                let photos = try JSONDecoder().decode(PhotoQuery.self, from: data)
                completion!(.success(photos))
            } catch {
                completion!(.failure(error))
            }
        }
    }
    
    func loadFriends( token: String, userId: Int, completion: ((Result<UserQuery,Error>) -> Void)? = nil) {
        let baseURL = "https://api.vk.com"
        let path = "/method/friends.get"
        
        var params = parameters
        params["user_id"] = Session.shared.userID
        params["extended"] = nil
        params["fields"] = "id, first_name, last_name, photo_100, online"
        
        SessionManager.session.request(baseURL + path, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return }
            do {
                let users = try JSONDecoder().decode(UserQuery.self, from: data)
                completion?(.success(users))
            } catch {
                completion?(.failure(error))
            }
        }
    }
    
    func loadGroups( token: String, userId: Int, completion: ((Result<GroupQuery, Error>) -> Void)? = nil) {
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.get"
        
        var params = parameters
        params["user_id"] = userId
        params["fields"] = "name"
        
        SessionManager.session.request(baseURL + path, method: .get, parameters: params).responseData { response in
            guard let data = response.value else { return }
            do {
                let groups = try JSONDecoder().decode(GroupQuery.self, from: data)
                completion?(.success(groups))
            } catch {
                completion?(.failure(error))
            }
        }
    }
    
//    func loadFilteredGroups( token: String, mask: String) {
//        let baseURL = "https://api.vk.com"
//        let path = "/method/groups.search"
//
//        var params = parameters
//        params["q"] = mask
//
//        SessionManager.session.request(baseURL + path, method: .get, parameters: params).responseJSON { response in
//            guard let data = response.value else { return }
//        }
//    }
}
