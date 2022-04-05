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
    
    lazy var faButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic_plus"), for: .normal)
        button.addTarget(self, action: #selector(fabTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let viewModel = MainViewModel(
        MainInteractorImp(AppDelegate.taskRepository)
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDate()
        setupFab()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let vc = segue.destination as? DetailsViewController {
                if let task = sender as? Task {
                    vc.taskId = task.id
                }
            }
        }
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
    
    func setupFab() {
        view.addSubview(faButton)
        NSLayoutConstraint.activate([
            faButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            faButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36),
            faButton.heightAnchor.constraint(equalToConstant: 80),
            faButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func loadData() {
        viewModel.loadTasks()
        count.text = "\(viewModel.completedTasks.count) completed, \(viewModel.incompleteTasks.count) incomplete"
        tableView.reloadData()
    }
    
    @objc func fabTapped(_ button: UIButton) {
        performSegue(withIdentifier: "toCreate", sender: nil)
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
        var task: Task? = nil
        switch indexPath.section {
        case 0:
            task = viewModel.completedTasks[indexPath.row]
            break
        case 1:
            task = viewModel.incompleteTasks[indexPath.row]
            break
        default: break
        }
        if let clickedTask = task {
            performSegue(withIdentifier: "toDetails", sender: clickedTask)
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
