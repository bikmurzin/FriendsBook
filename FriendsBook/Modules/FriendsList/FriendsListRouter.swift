//
//  Project: FriendsBook
//  File: FriendsListRouter.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import Foundation

protocol FriendsListRoutingLogic: AnyObject {
    func routeToUserDetailsViewController(userId: Int)
}

final class FriendsListRouter {
    weak var viewController: UserDetailsViewController?
    
    init(viewController: UserDetailsViewController? = nil) {
        self.viewController = viewController
    }
}

extension FriendsListRouter: FriendsListRoutingLogic {
    func routeToUserDetailsViewController(userId: Int) {
        DispatchQueue.main.async {
            let detailsUserViewController = UserDetailsBuilder().build(userId: userId)
            guard let viewController = self.viewController else { return }
            viewController.navigationController?.pushViewController(detailsUserViewController, animated: true)
        }
    }
}
