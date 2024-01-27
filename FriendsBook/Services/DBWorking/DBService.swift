//
//  Project: FriendsBook
//  File: DBService.swift
//  Created by: Robert Bikmurzin
//  Date: 27.01.2024
//

import Foundation
import RealmSwift

protocol IDataBaseService {
    func saveDataToDB(models: [UserModel])
    func loadDataFromDB() -> [UserModel]
    func deleteDataFromDB()
    func isObjectExists(userId: Int) -> Bool
    func isDBEmpty() -> Bool
}

final class DataBaseService {
    private let realm = try? Realm()
}

// MARK: - IRealmManager
extension DataBaseService: IDataBaseService {
    func saveDataToDB(models: [UserModel]) {
        guard let realm = realm else { return }
        let dbObjects = models.map { model in
            UserDBModel(dataModel: model)
        }
        for dbObject in dbObjects {
            do {
                try realm.write({
                    realm.add(dbObject)
                    print(Realm.Configuration.defaultConfiguration.fileURL!)
                })
            } catch let error as NSError {
                print("Something went wrong: \(error)")
            }
        }
    }
    
    func loadDataFromDB() -> [UserModel] {
        guard let realm = realm else { return [] }
        let dbItems = realm.objects(UserDBModel.self)
        let UserModels: [UserModel] = dbItems.map { result in
            return UserModel(userDBModel: result)
        }
        return UserModels
    }
    
    func deleteDataFromDB() {
        guard let realm = realm else { return }
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            print("Ошибка при удалении из БД: \(error)")
        }
    }
    
    func isObjectExists(userId: Int) -> Bool {
        guard let realm = realm else { return false }
        var isObjectExists = false
        do {
            try realm.write {
                let objects = realm.objects(UserDBModel.self).where {
                    $0.id == userId
                }
                isObjectExists = !objects.isEmpty
            }
        } catch let error as NSError {
            print("Ошибка при поиске объекта: \(error)")
        }
        return isObjectExists
    }
    
    func isDBEmpty() -> Bool {
        guard let realm = realm else { return false }
        return realm.isEmpty
    }
}
