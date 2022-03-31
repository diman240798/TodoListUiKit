//
//  CreateInteractor.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation

protocol CreateInteractor {
    func createTask(_ task: Task)
}

class CreateInteractorImpl : CreateInteractor {
    
    let repo: TaskRepository
    
    init(_ repo: TaskRepository) {
        self.repo = repo
    }
    
    func createTask(_ task: Task) {
        repo.createTask(task)
    }
}
