//
//  MainInteractor.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation

protocol MainInteractor {
    func getTasks() -> Array<Task>
}

class MainInteractorImp : MainInteractor {
    
    let repo: TaskRepository
    
    init(_ repo: TaskRepository) {
        self.repo = repo
    }
    
    func getTasks() -> Array<Task> {
        return repo.getTasks().map { entity in
            return Task(entity)
        }
    }
}
