//
//  TaskRepositoryRealmImplementaiton.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 07.04.2022.
//

import Foundation
import RealmSwift


class TaskRepositoryRealmImplementaiton : TaskRepository {
    
    let realm = try! Realm()
    
    init() {
        if getTasks().isEmpty {
            createTask(Task(UUID().uuidString, "Clean Room", "Description", true))
            createTask(Task(UUID().uuidString, "Feed cat", "Description", false))
        }
    }
    
    func createTask(_ task: Task) {
        realm.beginWrite()
        realm.add(TaskRealmEntity.createTask(task))
        try! realm.commitWrite()
    }
    
    func getTask(_ id: String) -> Task {
        return realm.objects(TaskRealmEntity.self)
            .first(where: { $0.id == id })!
            .toTask()
    }
    
    func getTasks() -> [Task] {
        return realm.objects(TaskRealmEntity.self)
            .map { $0.toTask() }
    }
}
