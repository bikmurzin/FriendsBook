//
//  Project: FriendsBook
//  File: UserDetailsRouter.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import Foundation

protocol UserDetailsRoutingLogic: AnyObject {
    func routeToFriendsListViewController()
}

final class UserDetailsRouter {
    weak var viewController: UserDetailsViewController?
    
    init(viewController: UserDetailsViewController? = nil) {
        self.viewController = viewController
    }
}

extension UserDetailsRouter: UserDetailsRoutingLogic {
    func routeToFriendsListViewController() {
        DispatchQueue.main.async {
            let friendsListViewController = FriendsListBuilder().build()
            guard let viewController = self.viewController else { return }
            viewController.navigationController?.pushViewController(friendsListViewController, animated: true)
        }
    }
}
