//
//  TaskRepository.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation

protocol TaskRepository {
    func getTasks() -> Array<TaskEntity>
}

class TaskRepositoryImpl : TaskRepository {
    
    func getTasks() -> Array<TaskEntity> {
        return [
            TaskEntity(0, "Clean Room", true),
            TaskEntity(1, "Feed cat", false)
        ]
    }
}
