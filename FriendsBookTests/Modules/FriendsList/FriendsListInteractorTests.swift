//
//  Project: FriendsBook
//  File: FriendsListInteractorTests.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

import Quick
import Nimble
@testable import FriendsBook

final class FriendListInteractorTests: QuickSpec {
    override class func spec() {
        var interactor: FriendsListInteractor!
        var dataWorkerMock: DataWorkerMock!
        var presenterMock: FriendListPresenterMock!
        
        beforeEach {
            presenterMock = FriendListPresenterMock()
            dataWorkerMock = DataWorkerMock()
            interactor = FriendsListInteractor(presenter: presenterMock, dataWorker: dataWorkerMock)
        }
        
        describe(".loadData") {
            it("should call loadUserDataAndUpdateIfNeeded in dataWorker") {
                // given
                dataWorkerMock.loadUserDataAndUpdateIfNeededStub = [Constants.userModel]
                
                // when
                interactor.loadData()
                
                // then
                expect(dataWorkerMock.loadUserDataAndUpdateIfNeededWasCalled).to(equal(1))
            }
            
            it("should call presentData in presenter") {
                // given
                dataWorkerMock.loadUserDataAndUpdateIfNeededStub = [Constants.userModel]
                var testResponse = FriendsListModels.Response(users: dataWorkerMock.loadUserDataAndUpdateIfNeededStub)
                
                // when
                interactor.loadData()
                
                // then
                waitUntil(timeout: NimbleTimeInterval.seconds(1)) { done in
                    expect(presenterMock.presentDataWasCalled).to(equal(1))
                    expect(presenterMock.receivedPresentDataResponse).to(equal(testResponse))
                    done()
                }
            }
        }
        
        describe(".refreshData") {
            it("should call loadAndUpdateUserData in dataWorker") {
                // given
                dataWorkerMock.loadAndUpdateUserDataStub = [Constants.userModel]
                
                // when
                interactor.refreshData()
                
                // then
                waitUntil(timeout: NimbleTimeInterval.seconds(1)) { done in
                    expect(dataWorkerMock.loadAndUpdateUserDataWasCalled).to(equal(1))
                    done()
                }
            }
            
            it("should call presentRefreshedData in presenter") {
                // given
                dataWorkerMock.loadAndUpdateUserDataStub = [Constants.userModel]
                var testResponse = FriendsListModels.Response(users: dataWorkerMock.loadAndUpdateUserDataStub)
                
                // when
                interactor.refreshData()
                
                // then
                waitUntil(timeout: NimbleTimeInterval.seconds(1)) { done in
                    expect(presenterMock.presentRefreshedDataWasCalled).to(equal(1))
                    expect(presenterMock.receivedPresentRefreshedData).to(equal(testResponse))
                    done()
                }
            }
        }
        
        describe(".loadNextScreenData") {
            it("should call presentNextScreenData in presenter") {
                // given
                dataWorkerMock.loadUserDataAndUpdateIfNeededStub = [Constants.userModel]
                interactor.loadData()
                
                // when
                waitUntil(timeout: NimbleTimeInterval.seconds(1)) { done in
                    interactor.loadNextScreenData(request: Constants.loadNextScreenDataRequest)
                    done()
                }
                
                // then
                expect(presenterMock.presentNextScreenDataWasCalled).to(equal(1))
                expect(presenterMock.receivedPresentNextScreenDataResponse).to(equal(Constants.loadNextScreenDataRequest))
            }
        }
    }
}

extension FriendListInteractorTests {
    enum Constants {
        static let loadNextScreenDataRequest = 12
        static let userModel = UserModel(id: 12, guid: "", isActive: true, balance: "", age: 1, eyeColor: "", name: "", gender: "", company: "", email: "", phone: "", address: "", about: "", registered: "", latitude: 0, longitude: 0, friends: [], favoriteFruit: "")
    }
}
