//
//  TaskCount.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 12.05.2022.
//

import Foundation

class TaskCount {
    let completed: Int
    let incomplete: Int
    
    init(_ completed: Int, _ incomplete: Int) {
        self.completed = completed
        self.incomplete = incomplete
    }
}
