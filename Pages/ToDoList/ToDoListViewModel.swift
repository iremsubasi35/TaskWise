//
//  ToDoListViewModel.swift
//  TaskWise
//
//  Created by Irem Subası on 28.03.2023.
//

import Foundation
import Combine

struct ToDoTaskPresentation {
    let task: String
}
struct ToDoTaskListPresentation {
    let tasks: [ToDoTaskPresentation]
    
    init(aims: [TaskListMemories]) {
        self.tasks = aims
            .compactMap { .init(task: $0.aim) }
    }
}

final class ToDoListViewModel {
    private let dataController: ToDoListDataController
    private let router: ToDoListRouter
    private var cancellables = Set<AnyCancellable>()
    
    private(set) var toDoListPresentation = CurrentValueSubject<ToDoTaskListPresentation?, Never>(nil)
    
    init(dataController: ToDoListDataController, router: ToDoListRouter) {
        self.dataController = dataController
        self.router = router
        addListeners()
    }
    
    func addNewTask(){
        router.navigateToNewTask()
    }
    
    func goToTaskDetail(_ presentation: ToDoTaskPresentation){
        router.navigateToDetail(with: presentation.task)
    }
    
    func updateUI(){
        
    }
}
// MARK: - Public
extension ToDoListViewModel{
        
        func initialize() {
            dataController.initialize()
//            let sampleTask = ToDoTaskPresentation.init(task: "iremefknwlkfnlekdwnjldnejlnfbleşmlimqşrekand.lekşfiale,iwldfEöfmşlkenlkfneşlknfkenflnekşfnejbkfjdhnşfmlenmflh3oıfrlmfdknclheofjoş4ejiflşençfn djfbldhf")
//            let presentation = ToDoTaskListPresentation(tasks: [sampleTask])
//            self.toDoListPresentation.send(presentation)
        }
}

// MARK: - Listeners
extension ToDoListViewModel{
    func addListeners(){
        dataController
            .myNotes
            .receive(on: DispatchQueue.main)
            .sink { [weak self] noteList in
                guard let self = self else {
                    return
                }
                
                let presentation = ToDoTaskListPresentation(aims: noteList)
                self.toDoListPresentation.send(presentation)
            }
            .store(in: &cancellables)
    }
}
