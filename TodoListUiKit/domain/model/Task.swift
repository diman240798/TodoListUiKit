//
//  Task.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation
import UIKit

class Task {
    let id: String
    let name: String
    let description: String
    let isComplete: Bool
    
    init(_ name: String, _ description: String) {
        self.id = UUID().uuidString
        self.name = name
        self.description = description
        self.isComplete = false
    }
    
    init(_ id: String, _ name: String, _ description: String, _ isComplete: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.isComplete = isComplete
    }
}
