//
//  MainViewController.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 18.01.2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class MainViewController : UIViewController {
    
    let disposeBag = DisposeBag()
    
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
    
    var viewModel: MainViewModel!
    
    private lazy var dataSource = RxTableViewSectionedReloadDataSource<SectionModel<TaskSection, TaskItem>>(configureCell: configureCell)
    private lazy var configureCell: RxTableViewSectionedReloadDataSource<SectionModel<TaskSection, TaskItem>>.ConfigureCell = { [unowned self] (dataSource, tableView, indexPath, item) in
        
        switch item {
        case .completed(let task):
            return self.completedCell(task, indexPath)
        case .incomplete(let task):
            return self.incompleteCell(task, indexPath)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date.text = DateUtils.getDate()
        setupFab()
        setupTableView()
        setTitle()
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
    
    func setupFab() {
        view.addSubview(faButton)
        NSLayoutConstraint.activate([
            faButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            faButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -36),
            faButton.heightAnchor.constraint(equalToConstant: 80),
            faButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func setTitle() {
        viewModel.tasksCount
            .subscribe(onNext: { taskCount in
                self.count.text = "\(taskCount.completed) completed, \(taskCount.incomplete) incomplete"
            })
            .disposed(by: self.disposeBag)
    }
    
    @objc func fabTapped(_ button: UIButton) {
        performSegue(withIdentifier: "toCreate", sender: nil)
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func setupTableView() {
        
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        let completedCelReg = UINib(nibName: "CompletedTaskCell", bundle: nil)
        tableView.register(completedCelReg, forCellReuseIdentifier: CompletedTaskCell.id)
        let incompleteCelReg = UINib(nibName: "IncompleteTaskCell", bundle: nil)
        tableView.register(incompleteCelReg, forCellReuseIdentifier: IncompleteTaskCell.id)
        
        tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        viewModel.tasks
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(TaskItem.self)
            .subscribe(onNext: { [weak self] taskItem in
                switch(taskItem) {
                case .completed(let task):
                    self?.onTaskClicked(task)
                case .incomplete(let task):
                    self?.onTaskClicked(task)
                default:
                    break
                }
            }).disposed(by: disposeBag)
    }
    
    func completedCell(_ task: Task, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CompletedTaskCell.id, for: indexPath) as! CompletedTaskCell
        cell.name.text = task.name
        return cell
    }
    
    func incompleteCell(_ task: Task, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IncompleteTaskCell.id, for: indexPath) as! IncompleteTaskCell
        cell.name.text = task.name
        return cell
    }
    
    func onTaskClicked(_ task: Task) {
        performSegue(withIdentifier: "toDetails", sender: task)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 16, y: 0, width: view.bounds.width, height: 42)
        let headerView = UIView(frame: frame)
        headerView.backgroundColor = .darkGray
        
        let title: String
        switch section {
        case 0:
            title = "Completed"
        case 1:
            title =  "Incomplete"
        default:
            title =  ""
        }
        
        let sectionLabel = UILabel(frame: frame)
        sectionLabel.text = title
        sectionLabel.textColor = .darkGray
        
        headerView.addSubview(sectionLabel)
        headerView.backgroundColor = .white
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}
