//
//  TaskDetailRouter.swift
//  TaskWise
//
//  Created by Irem Subası on 30.03.2023.
//

import Foundation
import Combine

final class TaskDetailRouter{
    func editAndGoToDoList() {
        
            let dataController = AddTaskDataController()
            let router = AddTaskRouter()
            let viewModel = AddTaskViewModel(dataController: dataController, router: router)
            let view = AddTaskVC(viewModel: viewModel)
            
            RoutingManager.shared.push(view)
    }
}
