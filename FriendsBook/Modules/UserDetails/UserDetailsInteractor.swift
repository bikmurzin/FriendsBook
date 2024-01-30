//
//  Project: FriendsBook
//  File: UserDetailsInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

protocol UserDetailsBusinessLogic: AnyObject {
    func loadData(userId: Int)
    func createNextScreen(request: UserDetailsNextScreenModels.Request)
}

final class UserDetailsInteractor {
    private let presenter: UserDetailsPresentationLogic
    private let dataWorker = DataWorker()
    private var userFriends: [UserModel] = []
    private var currentUser: UserModel?
    
    init(presenter: UserDetailsPresentationLogic) {
        self.presenter = presenter
    }
    
    private func getUserFriends(users: [UserModel], userId: Int) -> [UserModel] {
        let friendsIds = users.filter({ $0.id == userId })[0].friends
        let userFriends = users.filter({
            let user = $0
            return friendsIds.contains { friend in
                friend.id == user.id
            }
        })
        return userFriends
    }
}

extension UserDetailsInteractor: UserDetailsBusinessLogic {
    func loadData(userId: Int) {
        let users = dataWorker.loadData()
        guard !users.isEmpty else { return }
        currentUser = users.filter({ $0.id == userId })[0]
        guard let unwrCurrentUser = currentUser else { return }
        userFriends = getUserFriends(users: users, userId: userId)
        presenter.presentData(response: UserDetailsModels.Response(currentUser: unwrCurrentUser, userFriends: userFriends))
    }
    
    func createNextScreen(request: UserDetailsNextScreenModels.Request) {
        guard userFriends[request].isActive else { return }
        presenter.presentNextScreen(response: userFriends[request].id)
    }
}
