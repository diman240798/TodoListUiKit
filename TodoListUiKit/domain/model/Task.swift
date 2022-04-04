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
    let description: String
    let isComplete: Bool
    
    init(_ name: String, _ description: String) {
        self.id = -1
        self.name = name
        self.description = description
        self.isComplete = false
    }
    
    init(_ id: Int, _ name: String, _ description: String, _ isComplete: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.isComplete = isComplete
    }
}
