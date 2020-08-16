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
    
    var token: String = ""
    var userIDL: Int = 0
    
    private init() {}
    
    static let session: Alamofire.Session = {
        let configuration = Alamofire.URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        let session = Alamofire.Session(configuration: configuration)
        return session
    }()
    
    func loadFriends( token: String) {
        let baseURL = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
        "access_token" : token,
        "extended" : 1,
        "v" : "5.92"
        ]
        
        SessionManager.session.request(baseURL + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            print(json)
        }
    }
    
    func loadPhotos( token: String) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/photos.getAll"
        
        let params: Parameters = [
            "access_token" : token,
            "extended" : 1,
            "v" : "5.92"
        ]
        
        SessionManager.session.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            print(json)
        }
    }
    
    func loadGroups( token: String) {
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params : Parameters = [
            "access_token" : token,
            "extended" : 1,
            "v" : "5.92"
        ]
        
        SessionManager.session.request(baseURL + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            print(json)
        }
    }
    
    func loadFilteredGroups( token: String, mask: String) {
        let baseURL = "https://api.vk.com"
        let path = "/method/groups.search"
        
        let params: Parameters = [
            "access_token" : token,
            "extended" : 1,
            "v" : "9.52",
            "q" : mask
        ]
        
        SessionManager.session.request(baseURL + path, method: .get, parameters: params).responseJSON { response in
            guard let json = response.value else { return }
            print(json)
        }
    }
}
