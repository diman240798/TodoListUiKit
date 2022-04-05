//
//  DetailsViewController.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import UIKit

class DetailsViewController : ViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    
    
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
        nameText.text = task.name
        descriptionText.text = task.description
    }
}
