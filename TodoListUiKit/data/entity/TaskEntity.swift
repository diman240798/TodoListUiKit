//
//  TaskEntity.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation

class TaskEntity {
    let id: Int
    let name: String
    let isComplete: Bool
    
    init(_ id: Int, _ name: String, _ isComplete: Bool) {
        self.id = id
        self.name = name
        self.isComplete = isComplete
    }
}
