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
        interactor.createTask(Task(model.name))
    }
    
    func setName(name: String) {
        model.name = name
    }
}

class TaskModel {
    var name: String = ""
}
