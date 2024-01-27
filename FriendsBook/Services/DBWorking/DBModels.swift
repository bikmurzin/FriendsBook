//
//  Project: FriendsBook
//  File: DBModels.swift
//  Created by: Robert Bikmurzin
//  Date: 27.01.2024
//

import Foundation
import RealmSwift

final class UserDBModel: Object {
    @objc dynamic var  id: Int
    @objc dynamic var guid: String
    @objc dynamic var balance: String
    @objc dynamic var  age: Int
    @objc dynamic var  eyeColor: String
    @objc dynamic var  name: String
    @objc dynamic var  gender: String
    @objc dynamic var  company: String
    @objc dynamic var  email: String
    @objc dynamic var  phone: String
    @objc dynamic var  address: String
    @objc dynamic var  about: String
    @objc dynamic var  registered: String
    @objc dynamic var  latitude: Double
    @objc dynamic var  longitude: Double
    @objc dynamic var  tags: [String]
    @objc dynamic var  friends: [String: Int]
    @objc dynamic var  favoriteFruit: String
    
    init(dataModel: UserModel) {
        self.id = dataModel.id
        self.guid = dataModel.guid
        self.balance = dataModel.balance
        self.age = dataModel.age
        self.eyeColor = dataModel.eyeColor
        self.name = dataModel.name
        self.gender = dataModel.gender
        self.company = dataModel.company
        self.email = dataModel.email
        self.phone = dataModel.phone
        self.address = dataModel.address
        self.about = dataModel.about
        self.registered = dataModel.registered
        self.latitude = dataModel.latitude
        self.longitude = dataModel.longitude
        self.tags = dataModel.tags
        self.friends = dataModel.friends
        self.favoriteFruit = dataModel.favoriteFruit
    }
}


