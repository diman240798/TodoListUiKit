//
//  DetailsViewController.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import UIKit

class DetailsViewController : ViewController {
    
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    
    
    var viewModel: DetailsViewModel!
    
    var taskId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateText.text = DateUtils.getDate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadData()
    }
    
    func loadData() {
//        let task = viewModel.getTask(id: taskId)
//        nameText.text = task.name
//        descriptionText.text = task.description
    }
}
