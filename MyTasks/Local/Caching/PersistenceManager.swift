//
//  PersistenceManager.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 4/2/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import Foundation

enum Keys: String {
    case language = "language"
    case appleLanguage = "appleLanguages"
}

enum PersistenceAction {
    case remove, store
}

enum PersistenceError {
    case exist
}

class PersistenceManager {
    
    let defaults = UserDefaults.standard
    
    func retrive<T: Decodable>(key: Keys, type: T.Type) -> T? {
        guard let data = defaults.object(forKey: key.rawValue) as? Data, let result = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return result
    }
    
    func store<T: Encodable>(key: Keys, data: T) {
        do {
            let encodedData = try JSONEncoder().encode(data)
            defaults.set(encodedData, forKey: key.rawValue)
        } catch {
            Console.log("Error", "Parsing")
        }
    }
    
    func isExist(key: Keys) -> Bool {
        return defaults.object(forKey: key.rawValue) != nil
    }
    
    func delete(key: Keys) {
        if defaults.object(forKey: key.rawValue) != nil {
            defaults.removeObject(forKey: key.rawValue)
        }
    }
}
