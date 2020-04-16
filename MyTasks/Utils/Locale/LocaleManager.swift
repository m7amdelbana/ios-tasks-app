//
//  LocaleManager.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import Foundation

enum Language: String {
    case EN = "en"
    case AR = "ar"
}

class LocaleManager: PersistenceManager {
    
    static var shared = LocaleManager()
    
    func save(_ language: Language) {
        var appleLanguages = defaults.object(forKey: Keys.appleLanguage.rawValue) as! [String]
        appleLanguages.remove(at: 0)
        appleLanguages.insert(language.rawValue, at: 0)
        defaults.set(appleLanguages, forKey: Keys.appleLanguage.rawValue)
        defaults.synchronize()
        store(key: .language, data: language.rawValue)
    }
    
    func get() -> String! {
        if isExist() {
            return retrive(key: .language, type: String.self)
        } else {
            return String(Locale.preferredLanguages[0].prefix(2))
        }
    }
    
    func isExist() -> Bool {
        return isExist(key: .language)
    }
    
    func delete() {
        delete(key: .language)
    }
}


