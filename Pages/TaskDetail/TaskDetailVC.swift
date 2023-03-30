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
        
    }
}
