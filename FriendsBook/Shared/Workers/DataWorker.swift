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
    func loadData() -> [UserModel]
}

final class DataWorker {
    private let queue = DispatchQueue(label: "dataWorkerQueue")
    private let group = DispatchGroup()
    
    private func loadDataFromAPI() -> [UserModel] {
        var loadedUserModels: [UserModel] = []
        group.enter()
        NetworkService.makeRequest(urlString: Constants.urlString) { (result: Result<[UserModel], NetworkError>) in
            switch result {
            case .success(let userModels):
                DataBaseService.deleteDataFromDB()
                DataBaseService.saveDataToDB(models: userModels)
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
        return DataBaseService.loadDataFromDB()
    }
}

extension DataWorker: IDataWorker {
    
    /// Сначала загружает данные из интернета, затем сохраняет их в БД и после возвращает на выходе
    func loadAndUpdateUserData() -> [UserModel] {
        return loadDataFromAPI()
    }
    
    /// Возвращает данные, сохраненные ранее в БД. Если в БД записей нет, загрузит их из интернета.
    func loadUserDataAndUpdateIfNeeded() -> [UserModel] {
        if DataBaseService.isDBEmpty() {
            return loadDataFromAPI()
        } else {
            return loadDataFromDB()
        }
    }
    
    /// Возвращает данные только из БД
    func loadData() -> [UserModel] {
        if !DataBaseService.isDBEmpty() {
            return loadDataFromDB()
        }
        return []
    }
}

// MARK: - Constants
extension DataWorker {
    enum Constants {
        static let urlString = "https://firebasestorage.googleapis.com/v0/b/candidates--questionnaire.appspot.com/o/users.json?alt=media&token=e3672c23-b1a5-4ca7-bb77-b6580d75810c"
    }
}
