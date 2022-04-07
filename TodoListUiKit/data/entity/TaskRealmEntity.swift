//
//  TaskRealmEntity.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 07.04.2022.
//

import Foundation
import RealmSwift

class TaskRealmEntity : Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var isComplete: Bool = false
}

extension TaskRealmEntity {
    
    static func createTask(_ id: String, _ name: String, _ description: String, _ isComplete: Bool) -> TaskRealmEntity {
        let task = TaskRealmEntity()
        task.id = id
        task.name = name
        task.descriptionText = description
        task.isComplete = isComplete
        return task
    }
    
    static func createTask(_ model: Task) -> TaskRealmEntity {
        let task = TaskRealmEntity()
        task.id = model.id
        task.name = model.name
        task.descriptionText = model.description
        task.isComplete = model.isComplete
        return task
    }
    
    func toTask() -> Task {
        return Task(id, name, descriptionText, isComplete)
    }
}
