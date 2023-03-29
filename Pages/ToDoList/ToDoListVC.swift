//
//  ToDoListVC.swift
//  TaskWise
//
//  Created by Irem Subası on 28.03.2023.
//

import Foundation
import UIKit
import Combine

final class ToDoListVC: UIViewController{
    private let viewModel: ToDoListViewModel
    private var cancellables = Set<AnyCancellable>()
    
    
    private let toDoLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        label.contentMode = .center
        label.textAlignment = .center
        label.textColor = .black
        label.text = "To Do List"
        return label
    }()
    
    private let addTaskView: UIView = {
        let  view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addTaskImage: UIImageView = {
        let addTaskImage = UIImageView()
        addTaskImage.image = UIImage(systemName: "plus")
        addTaskImage.contentMode = .scaleAspectFit
        addTaskImage.translatesAutoresizingMaskIntoConstraints = false
        return addTaskImage
    }()
    
    private let tableViewToDo: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .blue
        return table
    }()
    
    @objc func addTaskAction(_ gestureRecognizer: UITapGestureRecognizer) {
        viewModel.addNewTask()
        }
    
    init(viewModel: ToDoListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Lifecycle
extension ToDoListVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUpUI()
        addListeners()
        viewModel.initialize()
    }
}

// MARK: - SetupUI
extension ToDoListVC{
    private  func setUpUI(){
        tableViewToDo.register(ToDoListViewCell.self, forCellReuseIdentifier: "Cell")
        tableViewToDo.delegate = self
        tableViewToDo.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addTaskAction(_:)))
        addTaskView.addGestureRecognizer(tapGesture)
//        view.addSubview(toDoLabel)
        view.addSubview(tableViewToDo)
//        view.addSubview(addTaskView)
        addTaskView.addSubview(addTaskImage)
        
//        toDoLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        toDoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        toDoLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
//        addTaskView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        addTaskView.leadingAnchor.constraint(equalTo: toDoLabel.trailingAnchor,constant: 0).isActive = true
//        addTaskView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        addTaskView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        addTaskView.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        addTaskView.bottomAnchor.constraint(equalTo: tableViewToDo.topAnchor, constant: 0).isActive = true
//
        
        tableViewToDo.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableViewToDo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableViewToDo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableViewToDo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
// MARK: - VİEWCELL
final class ToDoListViewCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        cellSetUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let viewCellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .left
        label.textAlignment = .left
        label.numberOfLines = 3
        label.textColor = .red
        return label
    }()
    
    private func cellSetUpUI(){
        self.addSubview(viewCellLabel)
        viewCellLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        viewCellLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4).isActive = true
        viewCellLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        viewCellLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4).isActive = true
    }
     func updateCell(_ presentation:ToDoTaskPresentation){
        viewCellLabel.text = presentation.task
     //    viewCellLabel.text = "irem"
    }
}
// MARK: - TableView
extension ToDoListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewToDo.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoListViewCell
        guard let presentation = viewModel.toDoListPresentation.value else {
            return cell
        }
        cell.updateCell(presentation.tasks[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let presentation = viewModel.toDoListPresentation.value else {
            return 0
        }
        print(presentation.tasks.count)
        return presentation.tasks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presentation = viewModel.toDoListPresentation.value else {
            return
        }
        let selectedTask = presentation.tasks[indexPath.row]
        viewModel.goToTaskDetail(selectedTask)
    }
    
    //    func tableView(_ tableView:UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
    //        guard editingStyle == .delete else { return }
    //    }
}

// MARK: - Listeners
extension ToDoListVC {
    private func addListeners() {
        viewModel
            .toDoListPresentation
            .receive(on: DispatchQueue.main)
            .sink { [weak self] presentation in
                guard let self = self else {
                    return
                }
                self.tableViewToDo.reloadData()
            }
            .store(in: &cancellables)
    }
}
