//
//  Project: FriendsBook
//  File: FriendsListInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

protocol FriendsListBusinessLogic: AnyObject {
    func loadData(request: FriendsListModels.Request)
}

final class FriendsListInteractor {
    private let presenter: FriendsListPresentationLogic
    
    init(presenter: FriendsListPresentationLogic) {
        self.presenter = presenter
    }
}

extension FriendsListInteractor: FriendsListBusinessLogic {
    func loadData(request: FriendsListModels.Request) {
        
    }
}
