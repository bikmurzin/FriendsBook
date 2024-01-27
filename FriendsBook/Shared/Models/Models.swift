//
//  Project: FriendsBook
//  File: Models.swift
//  Created by: Robert Bikmurzin
//  Date: 27.01.2024
//

struct UserModel: Equatable, Decodable {
    let id: Int
    let guid: String
    let balance: String
    let age: Int
    let eyeColor: String
    let name: String
    let gender: String
    let company: String
    let email: String
    let phone: String
    let address: String
    let about: String
    let registered: String
    let latitude: Double
    let longitude: Double
    let friends: [Friend]
    let favoriteFruit: String
    
    init(id: Int, guid: String, balance: String, age: Int, eyeColor: String, name: String, gender: String, company: String, email: String, phone: String, address: String, about: String, registered: String, latitude: Double, longitude: Double, friends: [Friend], favoriteFruit: String) {
        self.id = id
        self.guid = guid
        self.balance = balance
        self.age = age
        self.eyeColor = eyeColor
        self.name = name
        self.gender = gender
        self.company = company
        self.email = email
        self.phone = phone
        self.address = address
        self.about = about
        self.registered = registered
        self.latitude = latitude
        self.longitude = longitude
        self.friends = friends
        self.favoriteFruit = favoriteFruit
    }
    
    init (userDBModel: UserDBModel) {
        self.id = userDBModel.id
        self.guid = userDBModel.guid
        self.balance = userDBModel.balance
        self.age = userDBModel.age
        self.eyeColor = userDBModel.eyeColor
        self.name = userDBModel.name
        self.gender = userDBModel.gender
        self.company = userDBModel.company
        self.email = userDBModel.email
        self.phone = userDBModel.phone
        self.address = userDBModel.address
        self.about = userDBModel.about
        self.registered = userDBModel.registered
        self.latitude = userDBModel.latitude
        self.longitude = userDBModel.longitude
        self.friends = userDBModel.friends.map({ friend in
            Friend(id: friend.id)
        })
        self.favoriteFruit = userDBModel.favoriteFruit
    }
    
    struct Friend: Equatable, Decodable {
        let id: Int
    }
}
