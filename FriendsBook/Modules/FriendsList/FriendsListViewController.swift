//
//  Project: FriendsBook
//  File: FriendsListViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import UIKit

protocol FriendsListDisplayLogic: AnyObject {
    func displayData(viewModel: FriendsListModels.ViewModel)
    func displayRefreshedData(viewModel: FriendsListModels.ViewModel)
    func displayNextScreen(viewModel: FriendsListNextScreenModels.ViewModel)
}

final class FriendsListViewController: UIViewController {
    
    private let userId: Int?
    private let interactor: FriendsListBusinessLogic
    private let router: FriendsListRoutingLogic
    private let friendsListView = FriendsListView()
    
    init(interactor: FriendsListBusinessLogic, router: FriendsListRoutingLogic, userId: Int?) {
        self.interactor = interactor
        self.router = router
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = friendsListView
        friendsListView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadData(request: FriendsListModels.Request(userId: userId))
    }
}

// MARK: - FriendsListDisplayLogic
extension FriendsListViewController: FriendsListDisplayLogic {
    func displayData(viewModel: FriendsListModels.ViewModel) {
        friendsListView.updateUsersList(users: viewModel.users)
    }
    
    func displayRefreshedData(viewModel: FriendsListModels.ViewModel) {
        friendsListView.updateUsersList(users: viewModel.users)
        friendsListView.endRefreshing()
    }
    
    func displayNextScreen(viewModel: FriendsListNextScreenModels.ViewModel) {
        router.routeToUserDetailsViewController(userId: viewModel)
    }
}

// MARK: - DisplayFriendList
extension FriendsListViewController: DisplayFriendList {
    func didSelectUser(userId: Int) {
        interactor.loadNextScreenData(request: userId)
    }
    
    func refreshData() {
        interactor.refreshData(request: FriendsListModels.Request(userId: userId))
    }
}
