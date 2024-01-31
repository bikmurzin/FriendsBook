//
//  Project: FriendsBook
//  File: FriendsListRouterЬщсл.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

@testable import FriendsBook

final class FriendsListRouterMock: FriendsListRoutingLogic {
    private(set) var routeToUserDetailsViewControllerWasCalled = 0
    private(set) var receivedUserId: Int!
    func routeToUserDetailsViewController(userId: Int) {
        routeToUserDetailsViewControllerWasCalled += 1
        receivedUserId = userId
    }
}
