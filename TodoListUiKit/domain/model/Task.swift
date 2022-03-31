//
//  Task.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation
import UIKit

class Task {
    let id: Int
    let name: String
    let isComplete: Bool
    
    init(_ id: Int, _ name: String, _ isComplete: Bool) {
        self.id = id
        self.name = name
        self.isComplete = isComplete
    }
    
    init(_ entity: TaskEntity) {
        self.id = entity.id
        self.name = entity.name
        self.isComplete = entity.isComplete
    }
}
