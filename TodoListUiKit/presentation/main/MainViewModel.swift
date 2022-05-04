//
//  MainViewModel.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 18.01.2022.
//

import UIKit
import RxSwift

class MainViewModel {
    
    let interactor: MainInteractor
   
    let tasks: Observable<[Task]>
    
    
    var completedTasks: Observable<[Task]> = Observable.of([])
    var incompleteTasks: Observable<[Task]> = Observable.of([])
    
    
    init(_ interactor: MainInteractor) {
        self.interactor = interactor
        tasks = interactor.getTasks()
            .observe(on: MainScheduler.instance)
    }
    

    
    
    func loadTasks() {
//        interactor.getTasks()
//            .observe(on: MainScheduler.instance)
//            .subscribe { (tasks: [Task]) in
//                var completedTasks: [Task] = []
//                var incompleteTasks: [Task] = []
//                tasks.forEach { task in
//                    if (task.isComplete) {
//                        completedTasks.append(task)
//                    } else {
//                        incompleteTasks.append(task)
//                    }
//                }
//            }
    }
}
