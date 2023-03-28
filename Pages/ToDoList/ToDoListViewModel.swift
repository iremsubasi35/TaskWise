//
//  ToDoListViewModel.swift
//  TaskWise
//
//  Created by Irem Subası on 28.03.2023.
//

import Foundation
import Combine

final class ToDoListViewModel {
    private let dataController: ToDoListDataController
    private let router: ToDoListRouter
    private var cancellables = Set<AnyCancellable>()
    
    init(dataController: ToDoListDataController, router: ToDoListRouter) {
        self.dataController = dataController
        self.router = router
    }
    
    func addNewTask(){
        router.navigateToDetail()
    }
}
