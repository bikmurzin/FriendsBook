//
//  Project: FriendsBook
//  File: FriendsListPresenter.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

protocol FriendsListPresentationLogic: AnyObject {
    func presentData(response: FriendsListModels.Response)
    func presentRefreshedData(response: FriendsListModels.Response)
}

final class FriendsListPresenter {
    weak var viewController: FriendsListDisplayLogic?
    
    private func makeViewModel(response: FriendsListModels.Response) -> FriendsListModels.ViewModel {
        let users = response.users.map { user in
            FriendsListModels.ViewModel.User(id: user.id, name: user.name, email: user.email, isActive: user.isActive)
        }
        return FriendsListModels.ViewModel(users: users)
    }
}

extension FriendsListPresenter: FriendsListPresentationLogic {
    func presentData(response: FriendsListModels.Response) {
        viewController?.displayData(viewModel: makeViewModel(response: response))
    }
    
    func presentRefreshedData(response: FriendsListModels.Response) {
        viewController?.displayRefreshedData(viewModel: makeViewModel(response: response))
    }
}
