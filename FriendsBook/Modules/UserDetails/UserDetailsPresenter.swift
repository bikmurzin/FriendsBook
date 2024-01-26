//
//  Project: FriendsBook
//  File: UserDetailsPresenter.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

protocol UserDetailsPresentationLogic: AnyObject {
    
}

final class UserDetailsPresenter {
    weak var viewController: UserDetailsDisplayLogic?
}

extension UserDetailsPresenter: UserDetailsPresentationLogic {
    
}
