//
//  Project: FriendsBook
//  File: UserDetailsViewControllerTests.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

import Quick
import Nimble
@testable import FriendsBook

final class UserDetailsViewControllerTests: QuickSpec {
    override class func spec() {
        var interactorMock: UserDetailsInteractorMock!
        var viewController: UserDetailsViewController!
        var routerMock: UserDetailsRouterMock!
        var userId: Int!
        
        beforeEach {
            userId = 1
            interactorMock = UserDetailsInteractorMock()
            routerMock = UserDetailsRouterMock()
            viewController = UserDetailsViewController(interactor: interactorMock, router: routerMock, userId: userId)
        }
        
        describe(".viewDidLoad") {
            it("should call loadData in interactor") {
                // when
                viewController.viewDidLoad()
                
                // then
                expect(interactorMock.loadDataWasCalled).to(equal(1))
                expect(interactorMock.receivedLoadDataUserId).to(equal(userId))
            }
        }
        
        describe(".displayNextScreen") {
            it("should call routeToNextUserDetailsViewController in router") {
                // when
                viewController.displayNextScreen(viewModel: Constants.nextUserId)
                
                // then
                expect(routerMock.routeToNextUserDetailsViewControllerWasCalled).to(equal(1))
                expect(routerMock.receivedRouteToNextUserDetailsViewControllerUserId).to(equal(Constants.nextUserId))
            }
        }
        
        describe(".openLocation") {
            it("should call openLocation in interactor") {
                // when
                viewController.openLocation()
                
                // then
                expect(interactorMock.openLocationWasCalled).to(equal(1))
            }
        }

        describe(".makeCall") {
            it("should call makeCall in interactor") {
                // when
                viewController.makeCall()
                
                // then
                expect(interactorMock.makeCallWasCalled).to(equal(1))
            }
        }
        
        describe(".didSelectFriend") {
            it("should call createNextScreen in interactor") {
                // when
                viewController.didSelectFriend(friendId: Constants.nextUserId)
                
                // then
                expect(interactorMock.createNextScreenWasCalled).to(equal(1))
                expect(interactorMock.receivedCreateNextScreenRequest).to(equal(Constants.nextUserId))
            }
        }
        
    }
}
        
    extension UserDetailsViewControllerTests {
        enum Constants {
            static let nextUserId = 2
        }
    }
