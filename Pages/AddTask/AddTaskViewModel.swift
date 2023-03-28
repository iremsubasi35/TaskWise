//
//  AddTaskViewModel.swift
//  TaskWise
//
//  Created by Irem Subası on 28.03.2023.
//

import Foundation
import Combine

final class AddTaskViewModel{
    private let dataController: AddTaskDataController
    private let router: AddTaskRouter
    
    init(dataController: AddTaskDataController, router: AddTaskRouter) {
        self.dataController = dataController
        self.router = router
    }
}
