//
//  MainViewController.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 18.01.2022.
//

import UIKit

class MainViewController : UIViewController {
    
    @IBOutlet weak var date: UITextView!
    @IBOutlet weak var count: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = MainViewModel(
        MainInteractorImp(TaskRepositoryImpl())
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDate()
        setupTableView()
        loadData()
    }
    
    func setupDate() {
        let date = Date()
        let calendar = Calendar.current
        let monthNumber = calendar.component(.month, from: date)
        let monthName = DateFormatter().monthSymbols[monthNumber - 1]
        let day = calendar.component(.day, from: date)
        let year = calendar.component(.year, from: date)
        self.date.text = "\(monthName) \(day), \(year)"
    }
    
    
    func loadData() {
        viewModel.loadTasks()
        count.text = "\(viewModel.incompleteTasks.count) incomplete, \(viewModel.completedTasks.count) completed"
        tableView.reloadData()
    }
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        let completedCelReg = UINib(nibName: "CompletedTaskCell", bundle: nil)
        tableView.register(completedCelReg, forCellReuseIdentifier: CompletedTaskCell.id)
        let incompleteCelReg = UINib(nibName: "IncompleteTaskCell", bundle: nil)
        tableView.register(incompleteCelReg, forCellReuseIdentifier: IncompleteTaskCell.id)
    
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let newVc = storyboard!.instantiateViewController(withIdentifier: "DetailsViewController")
            navigationController?.pushViewController(newVc, animated: true)
            break
        case 1:
            break
        default: break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.completedTasks.count
        case 1:
            return viewModel.incompleteTasks.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: CompletedTaskCell.id, for: indexPath) as? CompletedTaskCell {
                cell.name.text = viewModel.completedTasks[indexPath.row].name
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: IncompleteTaskCell.id, for: indexPath) as? IncompleteTaskCell {
                cell.name.text = viewModel.incompleteTasks[indexPath.row].name
                return cell
            }
        default: return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section
        {
        case 0:
            return "Completed"
        case 1:
            return "Incomplete"
        default:
            return ""
        }
    }
}
