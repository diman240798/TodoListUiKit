//
//  MainInteractor.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation
import RxSwift

protocol MainInteractor {
    func getTasks() -> Observable<[Task]>
}

class MainInteractorImpl : MainInteractor {
    
    let repo: TaskRepository
    
    init(_ repo: TaskRepository) {
        self.repo = repo
    }
    
    func getTasks() -> Observable<[Task]> {
        return repo.getTasks()
    }
}
