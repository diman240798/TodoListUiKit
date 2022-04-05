//
//  TaskRepository.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation

protocol TaskRepository {
    func createTask(_ task: Task)
    func getTask(_ id: Int) -> Task
    func getTasks() -> [Task]
}

class TaskRepositoryImpl : TaskRepository {
    
    var tasks = [
        TaskEntity(0, "Clean Room", "Description", true),
        TaskEntity(1, "Feed cat", "Description", false)
    ]
    
    func createTask(_ task: Task) {
        tasks.append(TaskEntity(task))
    }
    
    func getTask(_ id: Int) -> Task {
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
