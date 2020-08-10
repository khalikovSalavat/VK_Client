//
//  Session.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 09.08.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    var token: String = ""
    var userID: Int = 0
        
    private init() {}
}
