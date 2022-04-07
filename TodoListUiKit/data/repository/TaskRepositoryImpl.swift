//
//  TaskRepositoryImpl.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 07.04.2022.
//

import Foundation

class TaskRepositoryImpl : TaskRepository {
    
    var tasks = [
        TaskEntity.createTask(UUID().uuidString, "Clean Room", "Description", true),
        TaskEntity.createTask(UUID().uuidString, "Feed cat", "Description", false)
    ]
    
    func createTask(_ task: Task) {
        tasks.append(TaskEntity.createTask(task))
    }
    
    func getTask(_ id: String) -> Task {
        return tasks
            .first(where: { $0.id == id })!
            .toTask()
    }
    
    func getTasks() -> [Task] {
        return tasks.map {
            $0.toTask()
        }
    }
}
