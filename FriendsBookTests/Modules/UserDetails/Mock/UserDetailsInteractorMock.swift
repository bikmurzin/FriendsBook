//
//  Project: FriendsBook
//  File: UserDetailsInteractorMock.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

@testable import FriendsBook

final class UserDetailsInteractorMock: UserDetailsBusinessLogic {
    private(set) var loadDataWasCalled = 0
    private(set) var receivedLoadDataUserId: Int!
    func loadData(userId: Int) {
        loadDataWasCalled += 1
        receivedLoadDataUserId = userId
    }
    
    private(set) var createNextScreenWasCalled = 0
    private(set) var receivedCreateNextScreenRequest: UserDetailsNextScreenModels.Request!
    func createNextScreen(request: FriendsBook.UserDetailsNextScreenModels.Request) {
        createNextScreenWasCalled += 1
        receivedCreateNextScreenRequest = request
    }
    
    private(set) var openLocationWasCalled = 0
    func openLocation() {
        openLocationWasCalled += 1
    }
    
    private(set) var makeCallWasCalled = 0
    func makeCall() {
        makeCallWasCalled += 1
    }
    
    private(set) var writeEmailWasCalled = 0
    func writeEmail() {
        writeEmailWasCalled += 1
    }
}
