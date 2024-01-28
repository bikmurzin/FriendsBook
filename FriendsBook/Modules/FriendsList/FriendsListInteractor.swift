//
//  Project: FriendsBook
//  File: FriendsListInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import Foundation

protocol FriendsListBusinessLogic: AnyObject {
    func loadData(request: FriendsListModels.Request)
    func refreshData(request: FriendsListModels.Request)
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
    
    private func getUserFriends(userId: Int) -> [UserModel] {
        let friendsIds = self.userModels.filter({ $0.id == userId })[0].friends
        let userFriends = self.userModels.filter({
            let user = $0
            return friendsIds.contains { friend in
                friend.id == user.id
            }
        })
        return userFriends
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
            if let userId = request.userId {
                self.presenter.presentData(response: FriendsListModels.Response(users: self.getUserFriends(userId: userId)))
            } else {
                self.presenter.presentData(response: FriendsListModels.Response(users: self.userModels))
            }
        }
    }
    
    func refreshData(request: FriendsListModels.Request) {
        group.enter()
        queue.async {
            self.userModels = self.dataWorker.loadAndUpdateUserData()
            self.group.leave()
        }
        group.notify(queue: .main) {
            if let userId = request.userId {
                self.presenter.presentRefreshedData(response: FriendsListModels.Response(users: self.getUserFriends(userId: userId)))
            } else {
                self.presenter.presentRefreshedData(response: FriendsListModels.Response(users: self.userModels))
            }
        }
    }
}
