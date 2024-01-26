//
//  Project: FriendsBook
//  File: FriendsListPresenter.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

protocol FriendsListPresentationLogic: AnyObject {
    
}

final class FriendsListPresenter {
    weak var viewController: FriendsListDisplayLogic?
}

extension FriendsListPresenter: FriendsListPresentationLogic {
    
}
