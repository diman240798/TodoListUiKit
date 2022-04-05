//
//  MainViewModel.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 18.01.2022.
//

import UIKit

class MainViewModel {
    
    let interactor: MainInteractor
    
    init(_ interactor: MainInteractor) {
        self.interactor = interactor
    }
    
    var completedTasks: [Task] = []
    var incompleteTasks: [Task] = []
    
    func loadTasks() {
        completedTasks.removeAll()
        incompleteTasks.removeAll()
        interactor.getTasks().forEach { task in
            if (task.isComplete) {
                completedTasks.append(task)
            } else {
                incompleteTasks.append(task)
            }
        }
    }
    
}
