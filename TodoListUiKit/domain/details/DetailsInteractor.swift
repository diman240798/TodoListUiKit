//
//  DetailsInteractor.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation
import RxSwift

protocol DetailsInteractor {
    
    func getTask(_ id: String) -> Single<Task>
    
    func setTaskComplete(_ taskId: Int) -> Single<Bool>
    
    func setTaskIncomplete(_ taskId: Int) -> Single<Bool>
}

class DetailsInteractorImpl : DetailsInteractor {
    
    let repo : TaskRepository
    
    init(_ repo: TaskRepository) {
        self.repo = repo
    }
    
    func getTask(_ id: String) -> Single<Task> {
        return repo.getTask(id)
    }
    
    func setTaskComplete(_ taskId: Int) -> Single<Bool> {
        return repo.setTaskComplete(taskId)
    }
    
    func setTaskIncomplete(_ taskId: Int) -> Single<Bool> {
        return repo.setTaskIncomplete(taskId)
    }
}
