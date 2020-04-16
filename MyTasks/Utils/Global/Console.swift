//
//  Console.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import Foundation

open class Console {
    
    static func log(_ tag: String, _ text: Any) {
        #if DEBUG
        print("\(tag): \(text)")
        #endif
    }
}


