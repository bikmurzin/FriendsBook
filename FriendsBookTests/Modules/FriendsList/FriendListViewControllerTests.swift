//
//  Project: FriendsBook
//  File: FriendListViewControllerTests.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

import Quick
import Nimble
@testable import FriendsBook

final class FriendListViewControllerTests: QuickSpec {
    override class func spec() {
        var interactorMock: FriendListInteractorMock!
        var viewController: FriendsListViewController!
        var routerMock: FriendsListRouterMock!
        
        beforeEach {
            interactorMock = FriendListInteractorMock()
            routerMock = FriendsListRouterMock()
            viewController = FriendsListViewController(interactor: interactorMock, router: routerMock)
        }
        
        describe(".viewDidLoad") {
            it("should call loadData in interactor") {
                // when
                viewController.viewDidLoad()
                
                // then
                expect(interactorMock.loadDataWasCalled).to(equal(1))
            }
        }
        
        describe(".didSelectUser") {
            it("should call loadNextScreenData in interactor") {
                // when
                viewController.didSelectUser(userId: Constants.didSelectUserId)
                
                // then
                expect(interactorMock.loadNextScreenDataWasCalled).to(equal(1))
                expect(interactorMock.receivedLoadNextScreenDataRequest).to(equal(Constants.didSelectUserId))
            }
        }
        
        describe(".refreshData") {
            it("should call refreshData in interactor") {
                // when
                viewController.refreshData()
                
                // then
                expect(interactorMock.refreshDataWasCalled).to(equal(1))
            }
        }
    }
}

extension FriendListViewControllerTests {
    enum Constants {
        static let didSelectUserId = 1
    }
}
