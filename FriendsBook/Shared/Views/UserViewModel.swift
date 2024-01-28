//
//  Project: FriendsBook
//  File: UserViewModel.swift
//  Created by: Robert Bikmurzin
//  Date: 28.01.2024
//

import Foundation

struct UserViewModel: Equatable {
    let users: [User]
    
    struct User: Equatable {
        let id: Int
        let name: String
        let email: String
        let isActive: Bool
    }
}
