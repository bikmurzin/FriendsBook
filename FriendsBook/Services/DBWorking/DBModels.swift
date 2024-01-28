//
//  Project: FriendsBook
//  File: DBModels.swift
//  Created by: Robert Bikmurzin
//  Date: 27.01.2024
//

import Foundation
import RealmSwift

final class UserDBModel: Object {
    @objc dynamic var  id: Int = 0
    @objc dynamic var guid: String = ""
    @objc dynamic var isActive: Bool = false
    @objc dynamic var balance: String = ""
    @objc dynamic var  age: Int = 0
    @objc dynamic var  eyeColor: String = ""
    @objc dynamic var  name: String = ""
    @objc dynamic var  gender: String = ""
    @objc dynamic var  company: String = ""
    @objc dynamic var  email: String = ""
    @objc dynamic var  phone: String = ""
    @objc dynamic var  address: String = ""
    @objc dynamic var  about: String = ""
    @objc dynamic var  registered: String = ""
    @objc dynamic var  latitude: Double = 0
    @objc dynamic var  longitude: Double = 0
    var friends = List<FriendDBModel>()
    @objc dynamic var  favoriteFruit: String = ""
    
    
    convenience init(dataModel: UserModel) {
        self.init()
        self.id = dataModel.id
        self.guid = dataModel.guid
        self.isActive = dataModel.isActive
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
        self.friends.append(objectsIn: dataModel.friends.map({ FriendDBModel(id: $0.id) }))
        self.favoriteFruit = dataModel.favoriteFruit
    }
}

final class FriendDBModel: Object {
    @objc dynamic var  id: Int = 0
    
    convenience init(id: Int) {
        self.init()
        self.id = id
    }
}

