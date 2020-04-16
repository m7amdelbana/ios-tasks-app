//
//  LocalizationUtilities.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit

let LOCAL = LocalizationUtilities.shared

class LocalizationUtilities: NSObject {
    
    var bundle: Bundle!
    
    class var shared: LocalizationUtilities {
        struct Singleton {
            static let instance: LocalizationUtilities = LocalizationUtilities()
        }
        return Singleton.instance
    }
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    func localizedString(key: String) -> String {
        return bundle.localizedString(forKey: key, value: "", table: nil)
    }
    
    func localizedImagePathForImg(imagename: String, type: String) -> String {
        guard let imagePath =  bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }
    
    func storeLanguage(language: Language) {
        LocaleManager.shared.save(language)
        if let languageDirectoryPath = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")  {
            bundle = Bundle.init(path: languageDirectoryPath)
        } else {
            resetLanguage()
        }
    }
    
    func resetLanguage() {
        bundle = Bundle.main
    }
    
    func getLanguage() -> String {
        return LocaleManager.shared.get()
    }
    
    func changeLocale() {
        getLanguage() == Language.EN.rawValue ? setLocale(.AR, .forceRightToLeft) : setLocale(.EN, .forceLeftToRight)
        
        RootRouter.resetApp()
    }
    
    func setDefaultAppLocale() {
        let locale = NSLocale.current.languageCode
        if locale == Language.EN.rawValue {
            setLocale(.EN, .forceLeftToRight)
        } else {
            setLocale(.AR, .forceRightToLeft)
        }
        
        RootRouter.resetApp()
    }
    
    func setLocale(_ language: Language, _ semanticContent: UISemanticContentAttribute? = nil) {
        storeLanguage(language: language)
        if semanticContent != nil {
            UIView.appearance().semanticContentAttribute = semanticContent!
        }
    }
}
