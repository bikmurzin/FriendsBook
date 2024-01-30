//
//  Project: FriendsBook
//  File: DBService.swift
//  Created by: Robert Bikmurzin
//  Date: 27.01.2024
//

import Foundation
import RealmSwift

// MARK: - IRealmManager
final class DataBaseService {
    static func saveDataToDB(models: [UserModel]) {
        guard let realm = try? Realm() else { return }
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
    
    static func loadDataFromDB() -> [UserModel] {
        guard let realm = try? Realm() else { return [] }
        let dbItems = realm.objects(UserDBModel.self)
        let UserModels: [UserModel] = dbItems.map { result in
            return UserModel(userDBModel: result)
        }
        return UserModels
    }
    
    static func deleteDataFromDB() {
        guard let realm = try? Realm() else { return }
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            print("Ошибка при удалении из БД: \(error)")
        }
    }
    
    static func isObjectExists(userId: Int) -> Bool {
        guard let realm = try? Realm() else { return false }
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
    
    static func isDBEmpty() -> Bool {
        guard let realm = try? Realm() else { return true }
        return realm.isEmpty
    }
}
