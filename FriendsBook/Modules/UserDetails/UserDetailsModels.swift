//
//  Project: FriendsBook
//  File: UserDetailsModels.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import UIKit

enum UserDetailsModels {
    
    struct Request: Equatable {
        let userId: Int
    }
    
    struct Response: Equatable {
        let currentUser: UserModel
        let userFriends: [UserModel]
    }
    
    typealias ViewModel = TableViewModel
    
    struct TableViewModel: Equatable {
        let info: Info
        let about: String
        let contacts: Contacts
        let location: String
        let friends: [UserViewModel.User]
        let additionalInfo: AdditionalInfo
        
        struct Info: Equatable {
            let name: String
            let age: String
            let company: String
            let registered: String
        }
        
        struct Contacts: Equatable {
            let email: String
            let phone: String
            let address: String
        }
        
        struct AdditionalInfo: Equatable {
            let eyeColor: UIColor
            let favoriteFruitImage: UIImage?
        }
    }
}

enum UserDetailsNextScreenModels {
    typealias Request = Int
    typealias Response = Int
    typealias ViewModel = Int
}

enum UserDetailsMailSendingModels {
    typealias Response = String    
    typealias ViewModel = String
}

enum UserDetailsMapModels {
    struct Response: Equatable {
        let latitude: String
        let longtitude: String
    }
    
    struct ViewModel: Equatable {
        let latitude: String
        let longtitude: String
    }
}
