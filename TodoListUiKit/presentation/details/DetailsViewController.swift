//
//  DetailsViewController.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import UIKit
import RxSwift

class DetailsViewController : ViewController {
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var completed: CheckBox!
    
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
        viewModel.getTask(id: taskId)
        
        viewModel.task
            .subscribe(onNext: {task in
                self.nameText.text = task.name
                self.descriptionText.text = task.description
                self.completed.isChecked = task.isComplete
            })
            .disposed(by: disposeBag)
        
        self.completed.setOnCheckedListener { checked in
            self.viewModel.setTaskComplete(self.taskId, checked)
                .subscribe(onSuccess: {success in
                    // ignored
                })
                .disposed(by: self.disposeBag)
        }
    }
}
