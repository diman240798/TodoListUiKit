//
//  TaskRepositoryRealmImplementaiton.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 07.04.2022.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift

class TaskRepositoryRealmImplementaiton : TaskRepository {
    
    let realm = try! Realm()
    
    init() {
        if realm.objects(TaskRealmEntity.self).isEmpty {
            createTask(Task(UUID().uuidString, "Clean Room", "Description", true))
            createTask(Task(UUID().uuidString, "Feed cat", "Description", false))
        }
    }
    
    func createTask(_ task: Task) {
        realm.beginWrite()
        realm.add(TaskRealmEntity.createTask(task))
        try! realm.commitWrite()
    }
    
    func getTask(_ id: String) -> Observable<Task> {
        return getTaskEntity(id)
            .map {$0.toTask()}
    }
    
    func getTasks() -> Observable<[Task]> {
        return Observable.collection(from: realm.objects(TaskRealmEntity.self))
            .map { $0.map { $0.toTask() } }
    }
    
    func setTaskComplete(_ taskId: String) -> Single<Bool> {
        return setTaskComplete(taskId, true)
    }
    
    func setTaskIncomplete(_ taskId: String) -> Single<Bool> {
        return setTaskComplete(taskId, false)
    }
    
    private func setTaskComplete(_ taskId: String, _ isComplete: Bool) -> Single<Bool> {
        return getTaskEntity(taskId)
            .map { task in
                do {
                    try self.writeTaskComplete(task, isComplete)
                    return true
                } catch {
                    return false
                }
            }
            .asSingle()
    }
    
    private func writeTaskComplete(_ task: TaskRealmEntity, _ isComplete: Bool) throws {
        try realm.write {
            task.isComplete = isComplete
        }
    }
    
    private func getTaskEntity(_ id: String) -> Observable<TaskRealmEntity> {
        let entity = realm.object(ofType: TaskRealmEntity.self, forPrimaryKey: id)!
        return Observable.from(object: entity)
    }
}
