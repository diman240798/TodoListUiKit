//
//  MainViewModel.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 18.01.2022.
//

import UIKit
import RxSwift
import RxDataSources

class MainViewModel {
    
    let interactor: MainInteractor
    
    let tasks = BehaviorSubject<[SectionModel<TaskSection, TaskItem>]>(value: [])
    
    let tasksCount = BehaviorSubject<TaskCount>(value: TaskCount(0, 0))
    
    init(_ interactor: MainInteractor) {
        self.interactor = interactor
        interactor.getTasks()
            .subscribe(onNext: { tasks in
                var completedTasks = [TaskItem]()
                var incompleteTasks = [TaskItem]()
                
                tasks.forEach {task in
                    if task.isComplete {
                        completedTasks.append(TaskItem.completed(task))
                    } else {
                        incompleteTasks.append(TaskItem.incomplete(task))
                    }
                }
                
                self.tasksCount.onNext(TaskCount(completedTasks.count, incompleteTasks.count))
                self.tasks.onNext(
                    [
                        SectionModel<TaskSection, TaskItem>(
                            model: .completed, items: completedTasks
                        ),
                        SectionModel<TaskSection, TaskItem>(
                            model: .incomplete, items: incompleteTasks
                        )
                    ]
                )
            })
    }
}
