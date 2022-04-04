//
//  TaskEntity.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation

class TaskEntity {
    let id: Int
    let name: String
    let description: String
    let isComplete: Bool
    
    init(_ id: Int, _ name: String, _ description: String, _ isComplete: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.isComplete = isComplete
    }
    
    init(_ entity: Task) {
        self.id = entity.id
        self.name = entity.name
        self.description = entity.description
        self.isComplete = entity.isComplete
    }
}

extension TaskEntity {
    
    func toTask() -> Task {
        return Task(id, name, description, isComplete)
    }
}
