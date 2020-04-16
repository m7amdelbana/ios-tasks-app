//
//  TaskManager.swift
//  MyTasks
//
//  Created by Mohamed Elbana on 2/15/20.
//  Copyright © 2020 Mohamed Elbana. All rights reserved.
//

import UIKit
import CoreData

let TASK = TaskManager.shared

class TaskManager {
    
    static let shared = TaskManager()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext?
    let entityName = "Tasks"
    
    init() {
        let persistentContainer = appDelegate.persistentContainer
        context = persistentContainer.viewContext
    }
    
    private func store(of model: Task) {
        let entity = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context!) as! Tasks
        entity.setValue(model.id.uuidString, forKey: "id")
        entity.setValue(model.text, forKey: "text")
        entity.setValue(model.priority.rawValue, forKey: "priority")
        entity.setValue(model.lastUpdate, forKey: "lastUpdate")
        
        do {
            try context?.save()
        } catch let error {
            Console.log("Error", error.localizedDescription)
        }
    }
    
    func retrieve() -> [Task] {
        let fetchRequest = NSFetchRequest<Tasks>(entityName: entityName)
        do {
            let results = try context?.fetch(fetchRequest)
            guard let data = results, !data.isEmpty else {
                return []
            }
            return mapData(data)
        } catch let error {
            Console.log("Error", error.localizedDescription)
            return []
        }
    }
    
    private func mapData(_ entities: [Tasks]) -> [Task] {
        var models: [Task] = []
        for element in entities {
            let model: Task = Task(with: element)
            models.append(model)
        }
        models.reverse()
        return models
    }
    
    private func update(with task: Task) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "id == %@", task.id.uuidString)
        do {
            let fetchResults = try context?.fetch(fetchRequest)
            let managedObject = fetchResults![0] as! Tasks
            managedObject.setValue(task.text, forKey: "text")
            managedObject.setValue(task.priority.rawValue, forKey: "priority")
            managedObject.setValue(task.lastUpdate, forKey: "lastUpdate")
            try context?.save()
        } catch let error {
            Console.log("Error", error.localizedDescription)
        }
    }
    
    func delete(taskId: UUID) {
        if let result = try? context?.fetch(Tasks.fetchRequest()) {
            for object in result as! [Tasks] {
                if object.id == taskId.uuidString {
                    context?.delete(object)
                }
            }
        }
    }
    
    func deleteAll() {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        _ = NSBatchDeleteRequest(fetchRequest: fetch)
    }
    
    func storeOrUpdate(task: Task) {
        if let result = try? context?.fetch(Tasks.fetchRequest()) {
            for object in result as! [Tasks] {
                if object.id == task.id.uuidString {
                    update(with: task)
                    return
                }
            }
            store(of: task)
        }
    }
}
