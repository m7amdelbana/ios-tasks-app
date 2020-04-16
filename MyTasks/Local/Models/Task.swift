//
//  Task.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import Foundation

enum Priority: Int {
    
    case high
    case medium
    case low
}

struct Task {
    
    var id: UUID
    var text: String
    var priority: Priority
    var lastUpdate: String
    
    init(id: UUID = UUID(), text: String, priority: Priority, lastUpdate: String) {
        self.id = id
        self.text = text
        self.priority = priority
        self.lastUpdate = lastUpdate
    }
    
    init(with entity: Tasks) {
        self.init(id: UUID(uuidString: entity.id ?? "") ?? UUID(), text: entity.text ?? "", priority: Priority(rawValue: Int(entity.priority))!, lastUpdate: entity.lastUpdate ?? "")
    }
    
    mutating func update(text: String, priority: Priority, lastUpdate: String) {
        self.text = text
        self.priority = priority
        self.lastUpdate = lastUpdate
    }
}
