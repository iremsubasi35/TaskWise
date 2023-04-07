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
        addListeners()
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    private(set) var taskDetailListPresentation = CurrentValueSubject<ToDoTaskPresentation?, Never>(nil)
    
    func readTask(){
        dataController.readTask()
      //  router.editAndGoToDoList()

    }
}
// MARK: - Listeners
extension TaskDetailViewModel{
    func addListeners(){
        dataController.currentListItem
            .receive(on: DispatchQueue.main)
            .sink { [weak self]  note in
                guard let self = self else {
                    return
                }
                if let note = note {
                    let presentation = ToDoTaskPresentation(id: note.id, task: note.description)
                    self.taskDetailListPresentation.send(presentation)
                    
                }
            }
            .store(in: &cancellables)
    }
}
