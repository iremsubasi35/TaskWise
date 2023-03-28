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
        return view
    }()
    
    private let addTaskImage: UIImageView = {
        let addTaskImage = UIImageView()
        addTaskImage.image = UIImage(systemName: "plus")
        addTaskImage.contentMode = .scaleAspectFit
        return addTaskImage
    }()
    
    private let tableViewToDo: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
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
        setUpUI()
        addListeners()
    }
}

// MARK: - SetupUI
extension ToDoListVC{
    private  func setUpUI(){
        tableViewToDo.delegate = self
        tableViewToDo.dataSource = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addTaskAction(_:)))
        addTaskView.addGestureRecognizer(tapGesture)
        view.addSubview(toDoLabel)
        view.addSubview(tableViewToDo)
        view.addSubview(addTaskView)
        addTaskView.addSubview(addTaskImage)
        
        toDoLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        toDoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        toDoLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addTaskView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        addTaskView.leadingAnchor.constraint(equalTo: toDoLabel.trailingAnchor,constant: 0).isActive = true
        addTaskView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        addTaskView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        addTaskView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        addTaskView.bottomAnchor.constraint(equalTo: tableViewToDo.topAnchor, constant: 0).isActive = true
        
        
        tableViewToDo.topAnchor.constraint(equalTo: toDoLabel.bottomAnchor, constant: 0).isActive = true
        tableViewToDo.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableViewToDo.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableViewToDo.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - TableView
extension ToDoListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
            return cell
        }
}

// MARK: - Listeners
extension ToDoListVC {
    private func addListeners() {
        
    }
}
