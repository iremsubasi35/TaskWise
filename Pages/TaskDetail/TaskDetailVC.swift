//
//  TaskDetailVC.swift
//  TaskWise
//
//  Created by Irem Subası on 30.03.2023.
//

import Foundation
import UIKit
import Combine

final class TaskDetailVC: UIViewController {
    private let viewModel: TaskDetailViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private let taskDescription: UILabel = {
       let tasklbl = UILabel()
        tasklbl.translatesAutoresizingMaskIntoConstraints = false
        tasklbl.textColor = .darkGray
        tasklbl.textAlignment = .center
        return tasklbl
    }()
    init(viewModel: TaskDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - Lifecycle
extension TaskDetailVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - setupUI
extension TaskDetailVC{
    private func setupUI(){
        view.backgroundColor = .white
        view.addSubview(taskDescription)
        
        taskDescription.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        taskDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        taskDescription .trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        taskDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = true
    }
}
