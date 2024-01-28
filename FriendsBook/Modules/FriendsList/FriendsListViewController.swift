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
}

final class FriendsListViewController: UIViewController {
    
    private let interactor: FriendsListBusinessLogic
    private let userId: Int?
    private let friendsListView = FriendsListView()
    
    init(interactor: FriendsListBusinessLogic, userId: Int?) {
        self.interactor = interactor
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
}

// MARK: - DisplayFriendList
extension FriendsListViewController: DisplayFriendList {
    func refreshData() {
        interactor.refreshData(request: FriendsListModels.Request(userId: userId))
    }
}
