//
//  TaskDetailDataController.swift
//  TaskWise
//
//  Created by Irem Subası on 30.03.2023.
//

import Foundation
import Combine

final class TaskDetailDataController {
    private let fileManager: Storage = .init()
    
    private(set) var  currentListItem = CurrentValueSubject<TaskListItem?, Never>(nil)
    
    private let  taskId: String
    init(taskId: String) {
        self.taskId = taskId
    }
    
    func readTask(){
     let taskArray =  fileManager.readTasks()
        taskArray.forEach { listItem in
            if taskId == listItem.id {
                currentListItem.send(listItem)
            }
        }
    }
}
