//
//  Project: FriendsBook
//  File: FriendListPresenterTests.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

import Quick
import Nimble
@testable import FriendsBook

final class FriendListPresenterTests: QuickSpec {
    override class func spec() {
        var viewControllerMock: FriendListViewControllerMock!
        var presenter: FriendsListPresenter!
        
        beforeEach {
            viewControllerMock = FriendListViewControllerMock()
            presenter = FriendsListPresenter()
            presenter.viewController = viewControllerMock
        }
        
        describe(".presentData") {
            it("should call displayData in view controller") {
                // given
                let testUser = Constants.presentDataResponse.users[0]
                let testViewModel = FriendsListModels.ViewModel(users: [FriendsListModels.ViewModel.User(id: testUser.id, name: testUser.name, email: testUser.email, isActive: testUser.isActive)])
                
                // when
                presenter.presentData(response: Constants.presentDataResponse)
                
                // then
                expect(viewControllerMock.displayDataWasCalled).to(equal(1))
                expect(viewControllerMock.receivedDisplayDataViewModel).to(equal(testViewModel))
                
            }
        }
        
        describe(".presentRefreshedData") {
            it("should call displayRefreshedData in view controller") {
                // given
                let testUser = Constants.presentDataResponse.users[0]
                let testViewModel = FriendsListModels.ViewModel(users: [FriendsListModels.ViewModel.User(id: testUser.id, name: testUser.name, email: testUser.email, isActive: testUser.isActive)])
                
                // when
                presenter.presentRefreshedData(response: Constants.presentDataResponse)
                
                // then
                expect(viewControllerMock.displayRefreshedDataWasCalled).to(equal(1))
                expect(viewControllerMock.receivedDisplayRefreshedDataViewModel).to(equal(testViewModel))
                
            }
        }
        
        describe(".presentNextScreenData") {
            it("should call displayNextScreen in view controller") {
                // when
                presenter.presentNextScreenData(response: Constants.presentNextScreenDataResponse)
                
                // then
                expect(viewControllerMock.displayNextScreenWasCalled).to(equal(1))
                expect(viewControllerMock.receivedDisplayNextScreenViewModel).to(equal(Constants.presentNextScreenDataResponse))
                
            }
        }
    }
}

extension FriendListPresenterTests {
    enum Constants {
        static let presentNextScreenDataResponse = 23
        static let presentDataResponse = FriendsListModels.Response(users: [UserModel(id: 0, guid: "", isActive: false, balance: "", age: 1, eyeColor: "", name: "", gender: "", company: "", email: "", phone: "", address: "", about: "", registered: "", latitude: 0, longitude: 0, friends: [], favoriteFruit: "")])
    }
}
