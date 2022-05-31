//
//  TaskRepository.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation
import RxSwift

protocol TaskRepository {
    
    func createTask(_ task: Task)
    
    func getTask(_ id: String) -> Single<Task>
    
    func getTasks() -> Observable<[Task]>
    
    func setTaskComplete(_ taskId: Int) -> Single<Bool>
    
    func setTaskIncomplete(_ taskId: Int) -> Single<Bool>
}
