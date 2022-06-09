//
//  DetailsInteractor.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation
import RxSwift

protocol DetailsInteractor {
    
    func getTask(_ id: String) -> Observable<Task>
    
    func setTaskComplete(_ taskId: String) -> Single<Bool>
    
    func setTaskIncomplete(_ taskId: String) -> Single<Bool>
}

class DetailsInteractorImpl : DetailsInteractor {
    
    let repo : TaskRepository
    
    init(_ repo: TaskRepository) {
        self.repo = repo
    }
    
    func getTask(_ id: String) -> Observable<Task> {
        return repo.getTask(id)
    }
    
    func setTaskComplete(_ taskId: String) -> Single<Bool> {
        return repo.setTaskComplete(taskId)
    }
    
    func setTaskIncomplete(_ taskId: String) -> Single<Bool> {
        return repo.setTaskIncomplete(taskId)
    }
}
