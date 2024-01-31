//
//  Project: FriendsBook
//  File: UserDetailsInteractorTests.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

import Quick
import Nimble
@testable import FriendsBook

final class UserDetailsInteractorTests: QuickSpec {
    override class func spec() {
        var interactor: UserDetailsInteractor!
        var dataWorkerMock: DataWorkerMock!
        var presenterMock: UserDetailsPresenterMock!
        
        beforeEach {
            presenterMock = UserDetailsPresenterMock()
            dataWorkerMock = DataWorkerMock()
            interactor = UserDetailsInteractor(presenter: presenterMock, dataWorker: dataWorkerMock)
        }
        
        describe(".loadData") {
            it("should call loadData in dataWorker") {
                // given
                dataWorkerMock.loadDataStub = [Constants.userModel]
                
                // when
                interactor.loadData(userId: Constants.loadDataUserId)
                
                // then
                expect(dataWorkerMock.loadDataWasCalled).to(equal(1))
            }
            
            it("should call presentData in presenter") {
                // given
                dataWorkerMock.loadDataStub = [Constants.userModel]
                var testResponse = UserDetailsModels.Response(currentUser: dataWorkerMock.loadDataStub[0], userFriends: [dataWorkerMock.loadDataStub[0]])
                
                // when
                interactor.loadData(userId: Constants.loadDataUserId)
                
                // then
                expect(presenterMock.presentDataWasCalled).to(equal(1))
                expect(presenterMock.receivedPresentDataResponse).to(equal(testResponse))
            }
        }
        
        describe(".createNextScreen") {
            it("should call presentNextScreen in presenter") {
                // given
                dataWorkerMock.loadDataStub = [Constants.userModel]
                interactor.loadData(userId: Constants.loadDataUserId)
                
                // when
                interactor.createNextScreen(request: Constants.createNextScreenRequest)
                
                // then
                expect(presenterMock.presentNextScreenWasCalled).to(equal(1))
                expect(presenterMock.receivedPresentNextScreenResponse).to(equal(Constants.loadDataUserId))
            }
        }
        
        describe(".writeEmail") {
            it("should call presentMail in presenter") {
                // given
                dataWorkerMock.loadDataStub = [Constants.userModel]
                interactor.loadData(userId: Constants.loadDataUserId)
                
                // when
                interactor.writeEmail()
                
                // then
                expect(presenterMock.presentMailWasCalled).to(equal(1))
                expect(presenterMock.receivedPresentMailResponse).to(equal(Constants.writeEmailResponse))
            }
        }
    }
}

extension UserDetailsInteractorTests {
    enum Constants {
        static let loadDataUserId = 12
        static let createNextScreenRequest = 0
        static let userModel = UserModel(id: 12, guid: "", isActive: true, balance: "", age: 1, eyeColor: "", name: "", gender: "", company: "", email: "email@email.com", phone: "", address: "", about: "", registered: "", latitude: 0, longitude: 0, friends: [UserModel.Friend(id: 12)], favoriteFruit: "")
        static let writeEmailResponse = "email@email.com"
    }
}
