//
//  DetailsViewModel.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation
import UIKit
import RxSwift

class DetailsViewModel {
    
    let task = BehaviorSubject(value: Task("", ""))
    
    let interactor: DetailsInteractor
    
    init(_ interactor: DetailsInteractor) {
        self.interactor = interactor
    }
    
    func getTask(id: String) {
        interactor.getTask(id)
            .subscribe(onNext: { task in
                self.task.onNext(task)
            })
    }
    
    func setTaskComplete(_ taskId: String, _ isComplete: Bool) -> Single<Bool> {
        if isComplete {
            return interactor.setTaskIncomplete(taskId)
        } else {
            return interactor.setTaskComplete(taskId)
        }
    }
}
