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
    struct ViewModel: Equatable {
        let users: [User]
        
        struct User: Equatable {
            let id: Int
            let name: String
            let email: String
            let isActive: Bool
        }
    }
}
