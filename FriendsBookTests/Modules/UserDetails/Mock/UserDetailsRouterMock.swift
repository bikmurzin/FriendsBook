//
//  Project: FriendsBook
//  File: UserDetailsRouterMock.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

@testable import FriendsBook

final class UserDetailsRouterMock: UserDetailsRoutingLogic {
    
    private(set) var routeToNextUserDetailsViewControllerWasCalled = 0
    private(set) var receivedRouteToNextUserDetailsViewControllerUserId: Int!
    func routeToNextUserDetailsViewController(userId: Int) {
        routeToNextUserDetailsViewControllerWasCalled += 1
        receivedRouteToNextUserDetailsViewControllerUserId = userId
    }
}
