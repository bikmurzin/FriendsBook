//
//  Project: FriendsBook
//  File: FriendsListModels.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

enum FriendsListModels {
    struct Request: Equatable {
        let userId: Int?
    }
    struct Response: Equatable {
        let users: [UserModel]
    }
    typealias ViewModel = UserViewModel
}

enum FriendsListNextScreenModels {
    typealias Request = Int
    typealias Response = Int
    typealias ViewModel = Int
}
