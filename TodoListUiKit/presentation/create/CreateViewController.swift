//
//  CreateViewController.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import UIKit

class CreateViewController : ViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var addBtn: UIButton!
    
    let viewModel = CreateViewModel(
        CreateInteractorImpl(AppDelegate.taskRepository)
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    
        addBtn.addTarget(self, action: #selector(addTaskClicked(_:)), for: .touchUpInside)
        nameText.addTarget(self, action: #selector(nameChanged(_:)), for: .editingChanged)
        descriptionText.delegate = self
    }
    
    @objc func addTaskClicked(_ button: UIButton) {
        viewModel.createTask()
        navigationController?.popViewController(animated: true)
    }
    
    @objc func nameChanged(_ textField: UITextField) {
        viewModel.setName(textField.text ?? "")
    }
}

extension CreateViewController : UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        viewModel.setDescription(textView.text ?? "")
    }
}


//override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    print(#function)
//}
//
//override func viewWillLayoutSubviews() {
//    super.viewWillLayoutSubviews()
//    print(#function)
//}
//
//override func viewDidLayoutSubviews() {
//    super.viewDidLayoutSubviews()
//    print(#function)
//}
//
//override func viewDidAppear(_ animated: Bool) {
//    super.viewDidAppear(animated)
//    print(#function)
//}
//
//override func viewWillDisappear(_ animated: Bool) {
//    super.viewWillDisappear(animated)
//    print(#function)
//}
//
//override func viewDidDisappear(_ animated: Bool) {
//    super.viewDidDisappear(animated)
//    print(#function)
//}
