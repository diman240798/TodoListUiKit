//
//  CreateViewModel.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation
import UIKit

class CreateViewModel {
    
    let interactor: CreateInteractor
    var model = TaskModel()
    
    init(_ interactor: CreateInteractor) {
        self.interactor = interactor
    }
    
    func createTask() {
        let task = model.toTask()
        interactor.createTask(task)
    }
    
    func setName(_ name: String) {
        model.name = name
    }
    
    func setDescription(_ description: String) {
        model.description = description
    }
}

struct TaskModel {
    var name: String = ""
    var description: String = ""
}

extension TaskModel {
    
    func toTask() -> Task {
        return Task(name, description)
    }
}
