//
//  Project: FriendsBook
//  File: UserDetailsPresenterTests.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

import Quick
import Nimble
import Foundation
import CoreLocation
import UIKit
@testable import FriendsBook

final class UserDetailsPresenterTests: QuickSpec {
    override class func spec() {
        var viewControllerMock: UserDetailsViewControllerMock!
        var presenter: UserDetailsPresenter!
        
        beforeEach {
            viewControllerMock = UserDetailsViewControllerMock()
            presenter = UserDetailsPresenter()
            presenter.viewController = viewControllerMock
        }
        
        describe(".presentData") {
            it("should call displayData in view controller") {
                // given
                let location = CLLocation(latitude: Constants.userModel.latitude, longitude: Constants.userModel.longitude)
                
                let testViewModel = UserDetailsModels.ViewModel(
                    info: UserDetailsModels.ViewModel.Info(name: "", age: "1", company: "", registered: "12:26 14.02.16"),
                    about: "",
                    contacts: UserDetailsModels.ViewModel.Contacts(email: "email@email.com", phone: "", address: ""),
                    location: location.dms,
                    friends: [UserViewModel.User(id: Constants.userModel.id, name: Constants.userModel.name, email: Constants.userModel.email, isActive: Constants.userModel.isActive)],
                    additionalInfo: UserDetailsModels.ViewModel.AdditionalInfo(eyeColor: Constants.greenEyeColor, favoriteFruitImage: Constants.favoriteFruitImage))
                
                // when
                presenter.presentData(response: UserDetailsModels.Response(currentUser: Constants.userModel, userFriends: [Constants.userModel]))
                
                // then
                expect(viewControllerMock.displayDataWasCalled).to(equal(1))
                expect(viewControllerMock.receivedDisplayDataViewModel).to(equal(testViewModel))
            }
        }
        
        describe(".presentNextScreen") {
            it("should call displayNextScreen in view controller") {
                // when
                presenter.presentNextScreen(response: Constants.presentNextScreenDataResponse)
                
                // then
                expect(viewControllerMock.displayNextScreenWasCalled).to(equal(1))
                expect(viewControllerMock.receivedDisplayNextScreenViewModel).to(equal(Constants.presentNextScreenDataResponse))
            }
        }
        
        describe(".presentMail") {
            it("should call displayMail in view controller") {
                // when
                presenter.presentMail(response: Constants.writeEmailResponse)
                
                // then
                expect(viewControllerMock.displayMailWasCalled).to(equal(1))
                expect(viewControllerMock.receivedDisplayMailViewModel).to(equal(Constants.writeEmailResponse))
            }
        }
    }
}


extension UserDetailsPresenterTests {
    enum Constants {
        static let presentNextScreenDataResponse = 12
        static let userModel = UserModel(id: 12, guid: "", isActive: true, balance: "", age: 1, eyeColor: "green", name: "", gender: "", company: "", email: "email@email.com", phone: "", address: "", about: "", registered: "2016-02-14T09:26:27 -03:00", latitude: -20.150163, longitude: -2.513911, friends: [UserModel.Friend(id: 12)], favoriteFruit: "banana")
        static let writeEmailResponse = "email@email.com"
        static let greenEyeColor: UIColor = UIColor(red: 25/255.0, green: 163/255.0, blue: 55/255.0, alpha: 1)
        static let favoriteFruitImage: UIImage? = UIImage(named: "banana")
    }
}
