//
//  Project: FriendsBook
//  File: DataWorker.swift
//  Created by: Robert Bikmurzin
//  Date: 27.01.2024
//

protocol IDataWorker {
    func loadAndUpdateUserData()
    func loadUserDataAndUpdateIfNeeded()
}

final class DataWorker {
    let networkService = NetworkService()
    let dbService = DataBaseService()
}

extension DataWorker: IDataWorker {
    func loadAndUpdateUserData() {
        
    }
    
    func loadUserDataAndUpdateIfNeeded() {
        
    }
}
