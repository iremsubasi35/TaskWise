//
//  ToDoListRouter.swift
//  TaskWise
//
//  Created by Irem Subası on 28.03.2023.
//

import Foundation
import Combine

final class ToDoListRouter {
    func navigateToNewTask() {
        let dataController = AddTaskDataController()
        let router = AddTaskRouter()
        let viewModel = AddTaskViewModel(dataController: dataController, router: router)
        let view = AddTaskVC(viewModel: viewModel)
        
        RoutingManager.shared.push(view)
    }
    
    func navigateToDetail(with taskId: String) {
        let dataController = TaskDetailDataController(taskId: taskId)
        let router = TaskDetailRouter()
        let viewModel = TaskDetailViewModel(dataController: dataController, router: router)
        let view = TaskDetailVC(viewModel: viewModel)
        
        RoutingManager.shared.push(view)
    }
}
