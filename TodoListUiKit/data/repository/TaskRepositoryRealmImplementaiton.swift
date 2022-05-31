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
    
    func getTask(_ id: String) -> Single<Task> {
        
        return Observable.from(realm.objects(TaskRealmEntity.self))
            .filter { $0.id == id }
            .take(1)
            .map {$0.toTask()}
            .asSingle()
    }
    
    func getTasks() -> Observable<[Task]> {
        return Observable.collection(from: realm.objects(TaskRealmEntity.self))
            .map { $0.map { $0.toTask() } }
    }
    
    func setTaskComplete(_ taskId: Int) -> Single<Bool> {
        return Single<Bool>.create { single in
            do {
                try self.setTaskComplete(taskId, true)
                single(.success(true))
                
            } catch {
                single(.success(false))
            }
            return Disposables.create()
        }
    }
    
    func setTaskIncomplete(_ taskId: Int)  -> Single<Bool> {
        return Single<Bool>.create { single in
            do {
                try self.setTaskComplete(taskId, false)
                single(.success(true))
                
            } catch {
                single(.success(false))
            }
            return Disposables.create()
        }
    }
    
    private func setTaskComplete(_ taskId: Int, _ isComplete: Bool) throws {
        realm.beginWrite()
        var task = realm.object(ofType: TaskRealmEntity.self, forPrimaryKey: taskId)!
        task.isComplete = isComplete
        realm.add(task, update: Realm.UpdatePolicy.modified)
        try realm.commitWrite()
    }
}
