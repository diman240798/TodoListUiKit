//
//  DetailsViewController.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation

class DetailsViewController : ViewController {
    
    let viewModel = DetailsViewModel(
        DetailsInteractorImpl(AppDelegate.taskRepository)
    )
    
    var taskId = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData() {
        let task = viewModel.getTask(id: taskId)
    }
}
