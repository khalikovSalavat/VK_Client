//
//  User.swift
//  VK_Client
//
//  Created by Salavat Khalikov on 14.07.2020.
//  Copyright © 2020 Salavat Khalikov. All rights reserved.
//

import UIKit

struct User {
    let name: String
    let surname: String
    var photo: UIImage!
    var photoCollection: [UserPhoto]
    var groups: [Group]
    
    init(name: String, surname: String, photoCollection: [UserPhoto], groups: [Group]) {
        self.name = name
        self.surname = surname
        self.groups = groups
        self.photo = UIImage(named: self.name + self.surname)
        self.photoCollection = photoCollection
    }
}
private var photoCollection: [UserPhoto] = [
    UserPhoto(image: UIImage(named: "photo1"), likesCount: 0),
    UserPhoto(image: UIImage(named: "photo2"), likesCount: 0),
    UserPhoto(image: UIImage(named: "photo3"), likesCount: 0),
    UserPhoto(image: UIImage(named: "photo4"), likesCount: 0),
    UserPhoto(image: UIImage(named: "photo5"), likesCount: 0),
]

var friends: [String : User] = [
    "СтивДжобс" : User(name: "Стив", surname: "Джобс", photoCollection: photoCollection, groups: [(Group(name: "Gr1", icon: UIImage(named: "groupIcon")!))]),
    "ДжонатанАйв" : User(name: "Джонатан", surname: "Айв", photoCollection: photoCollection, groups: [(Group(name: "Gr2", icon: UIImage(named: "groupIcon")!))]),
    "ТимКук" : User(name: "Тим", surname: "Кук", photoCollection: photoCollection, groups: [(Group(name: "Gr3", icon: UIImage(named: "groupIcon")!))]),
]
