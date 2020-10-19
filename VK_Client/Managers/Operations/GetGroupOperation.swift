//
//  GroupOperations.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 30.09.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import Foundation
import Alamofire
import RealmSwift

class GetGroupOperation: AsyncOperation {
    
    private var request: DataRequest
    var data: Data?
    
    
    override func cancel() {
        request.cancel()
        super.cancel()
    }
    
    init(request: DataRequest) {
        self.request = request
    }
    
    
    override func main() {
        
        request.responseData(queue: DispatchQueue.global()) { [weak self] response in
            self?.data = response.data
            self?.state = .finished
        }
    }
    
}
