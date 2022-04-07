//
//  TaskEntity.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation

class TaskEntity {
    dynamic var id = UUID().uuidString
    dynamic var name: String = ""
    dynamic var descriptionText: String = ""
    dynamic var isComplete: Bool = false
}

extension TaskEntity {
    
    static func createTask(_ id: String, _ name: String, _ description: String, _ isComplete: Bool) -> TaskEntity {
        let task = TaskEntity()
        task.id = id
        task.name = name
        task.descriptionText = description
        task.isComplete = isComplete
        return task
    }
    
    static func createTask(_ model: Task) -> TaskEntity {
        let task = TaskEntity()
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
