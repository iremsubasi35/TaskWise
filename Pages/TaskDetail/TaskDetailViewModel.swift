//
//  TaskDetailViewModel.swift
//  TaskWise
//
//  Created by Irem Subası on 30.03.2023.
//

import Foundation
import Combine

final class TaskDetailViewModel {
    private let dataController: TaskDetailDataController
    private let router: TaskDetailRouter
    
    init(dataController: TaskDetailDataController, router: TaskDetailRouter) {
        self.dataController = dataController
        self.router = router
    }
}
