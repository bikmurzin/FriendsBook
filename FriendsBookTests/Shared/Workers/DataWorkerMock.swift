//
//  Project: FriendsBook
//  File: DataWorkerMock.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

@testable import FriendsBook

final class DataWorkerMock: IDataWorker {
    
    private(set) var loadAndUpdateUserDataWasCalled = 0
    var loadAndUpdateUserDataStub: [FriendsBook.UserModel]!
    func loadAndUpdateUserData() -> [FriendsBook.UserModel] {
        loadAndUpdateUserDataWasCalled += 1
        return loadAndUpdateUserDataStub
    }
    
    private(set) var loadUserDataAndUpdateIfNeededWasCalled = 0
    var loadUserDataAndUpdateIfNeededStub: [FriendsBook.UserModel]!
    func loadUserDataAndUpdateIfNeeded() -> [FriendsBook.UserModel] {
        loadUserDataAndUpdateIfNeededWasCalled += 1
        return loadUserDataAndUpdateIfNeededStub
    }
    
    private(set) var loadDataWasCalled = 0
    var loadDataStub: [FriendsBook.UserModel]!
    func loadData() -> [FriendsBook.UserModel] {
        loadDataWasCalled += 1
        return loadDataStub
    }
}
