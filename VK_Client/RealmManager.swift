//
//  RealmManager.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 29.08.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init?() {
        let conf = Realm.Configuration(schemaVersion: 1, deleteRealmIfMigrationNeeded: true)
        guard let realm = try? Realm(configuration: conf) else { return nil }
        print(realm.configuration.fileURL)
        self.realm = realm
        
        print("Realm DataBase path is:")
        print(realm.configuration.fileURL ?? "Realm error")
    }
    
    private let realm: Realm
    
    func add<T: Object>(object: T) throws {
        try realm.write {
            realm.add(object, update: .all)
        }
    }
    
    func add<T: Object>(objects: [T]) throws {
        try realm.write {
            realm.add(objects, update: .all)
        }
    }
    
    func delete<T: Object> (object: T) throws {
        try realm.write {
            realm.delete(object)
        }
    }
    
    func deleteAll() throws {
        try realm.write {
            realm.deleteAll()
        }
    }
 
    func getObjects<T: Object>() -> Results<T> {
        return realm.objects(T.self)
    }
}
