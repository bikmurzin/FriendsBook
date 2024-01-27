//
//  Project: FriendsBook
//  File: FriendsListInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import Foundation

protocol FriendsListBusinessLogic: AnyObject {
    func loadData(request: FriendsListModels.Request)
}

final class FriendsListInteractor {
    private let presenter: FriendsListPresentationLogic
    private let dataWorker = DataWorker()
    private var userModels: [UserModel] = []
    private let group = DispatchGroup()
    private let queue = DispatchQueue(label: "friendsListInteractorQueue")
    
    init(presenter: FriendsListPresentationLogic) {
        self.presenter = presenter
    }
}

extension FriendsListInteractor: FriendsListBusinessLogic {
    func loadData(request: FriendsListModels.Request) {
        group.enter()
        queue.async {
            self.userModels = self.dataWorker.loadUserDataAndUpdateIfNeeded()
            self.group.leave()
        }
        group.notify(queue: .main) {
            print("self.userModels: \(self.userModels)")
        }
    }
}
