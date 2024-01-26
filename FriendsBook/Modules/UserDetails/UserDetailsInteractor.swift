//
//  Project: FriendsBook
//  File: UserDetailsInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

protocol UserDetailsBusinessLogic: AnyObject {
    func loadData()
}

final class UserDetailsInteractor {
    private let presenter: UserDetailsPresentationLogic
    
    init(presenter: UserDetailsPresentationLogic) {
        self.presenter = presenter
    }
}

extension UserDetailsInteractor: UserDetailsBusinessLogic {
    func loadData() {
        
    }
}
