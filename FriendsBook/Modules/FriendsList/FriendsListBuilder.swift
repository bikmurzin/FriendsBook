//
//  Project: FriendsBook
//  File: FriendsListBuilder.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import UIKit

protocol FriendsListBuildLogic: AnyObject {
    func build(userId: Int?) -> UIViewController
}

final class FriendsListBuilder: FriendsListBuildLogic {
    func build(userId: Int? = nil) -> UIViewController {
        let presenter = FriendsListPresenter()
        let interactor = FriendsListInteractor(presenter: presenter)
        let router = FriendsListRouter()
        let viewController = FriendsListViewController(interactor: interactor, router: router, userId: userId)
        router.viewController = viewController

        presenter.viewController = viewController
        return viewController
    }
}
