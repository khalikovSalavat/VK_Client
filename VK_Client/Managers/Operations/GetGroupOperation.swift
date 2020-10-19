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
//        SessionManager.shared.loadData(methodType: .groups, type: Data.self) {
//            [weak self] result in
//            switch result {
//            case let .success(data):
//                self?.data = data as? Data
//                print(self?.data as Any)
//            case let .failure(error):
//                print(error)
//            }
//            self?.state = .finished
//        }
    }
    
}
