//
//  DetailsInteractor.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation

protocol DetailsInteractor {
    func getTask(_ id: Int) -> Task
    func setTaskComplete(taskId: Int)
    func setTaskIncomplete(taskId: Int)
}

class DetailsInteractorImpl : DetailsInteractor {
    
    let repo : TaskRepository
    
    init(_ repo: TaskRepository) {
        self.repo = repo
    }
    
    func getTask(_ id: Int) -> Task {
        return repo.getTask(id)
    }
    
    func setTaskComplete(taskId: Int) {
        
    }
    
    func setTaskIncomplete(taskId: Int) {
        
    }
    
    
}
