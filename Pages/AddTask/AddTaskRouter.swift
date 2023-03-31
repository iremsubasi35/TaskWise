//
//  AddTaskRouter.swift
//  TaskWise
//
//  Created by Irem Subası on 28.03.2023.
//

import Foundation
import Combine

final class AddTaskRouter{
    func navigateToToDoList() {
        let dataController = ToDoListDataController()
        let router = ToDoListRouter()
        let viewModel = ToDoListViewModel(dataController: dataController, router: router)
        let view = ToDoListVC(viewModel: viewModel)
        
        RoutingManager.shared.push(view)
    }
}
