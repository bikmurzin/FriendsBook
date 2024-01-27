//
//  Project: FriendsBook
//  File: DataWorker.swift
//  Created by: Robert Bikmurzin
//  Date: 27.01.2024
//

import Foundation

protocol IDataWorker {
    func loadAndUpdateUserData() -> [UserModel]
    func loadUserDataAndUpdateIfNeeded() -> [UserModel]
}

final class DataWorker {
    private let networkService = NetworkService()
    private let dbService = DataBaseService()
    private let queue = DispatchQueue(label: "dataWorkerQueue")
    private let group = DispatchGroup()
    
    private func loadDataFromAPI() -> [UserModel] {
        var loadedUserModels: [UserModel] = []
        group.enter()
        networkService.makeRequest(urlString: Constants.urlString) { (result: Result<[UserModel], NetworkError>) in
            switch result {
            case .success(let userModels):
                self.dbService.deleteDataFromDB()
                self.dbService.saveDataToDB(models: userModels)
                loadedUserModels = userModels
                self.group.leave()
            case .failure(let error):
                print(error)
                self.group.leave()
            }
        }
        group.wait()
        return loadedUserModels
    }
    
    private func loadDataFromDB() -> [UserModel] {
        return dbService.loadDataFromDB()
    }
}

extension DataWorker: IDataWorker {
    
    func loadAndUpdateUserData() -> [UserModel] {
        return loadDataFromAPI()
    }
    
    func loadUserDataAndUpdateIfNeeded() -> [UserModel] {
        if dbService.isDBEmpty() {
            return loadDataFromAPI()
        } else {
            return loadDataFromDB()
        }
    }
}

// MARK: - Constants
extension DataWorker {
    enum Constants {
        static let urlString = "https://firebasestorage.googleapis.com/v0/b/candidates--questionnaire.appspot.com/o/users.json?alt=media&token=e3672c23-b1a5-4ca7-bb77-b6580d75810c"
    }
}
