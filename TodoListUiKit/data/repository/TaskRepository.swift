//
//  TaskRepository.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation

protocol TaskRepository {
    func createTask(_ task: Task)
    func getTask(_ id: String) -> Task
    func getTasks() -> [Task]
}
