//
//  FileManager.swift
//  TaskWise
//
//  Created by Irem Subası on 30.03.2023.
//

import Foundation
import Combine
import UIKit


final class Storage{
    
    func createNewTask(description: String) {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filePath = documentsDirectory.appendingPathComponent("TaskList").appendingPathExtension("json")
        if !FileManager.default.fileExists(atPath: filePath.path) {
            FileManager.default.createFile(atPath: filePath.path, contents: nil, attributes: nil)
        }

        var currentTasks = readTasks()
        let id = UUID().uuidString
        let newTask = TaskListItem(id: id, description: description)
        currentTasks.append(newTask)

        guard let jsonData = try? JSONEncoder().encode(currentTasks)
        else { return }
    }
    
    func readTasks() -> [TaskListItem] {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filePath = documentsDirectory.appendingPathComponent("TaskList").appendingPathExtension("json")

        guard FileManager.default.fileExists(atPath: filePath.path),
            let data = try? Data(contentsOf: filePath),
                let recipes = try? JSONDecoder().decode([TaskListItem].self, from: data) else {
            return []
        }

        return recipes
    }

    func deleteTask(_ taskId: String) {
        let currentTasks = readTasks()
        var newTasks: [TaskListItem] = []

        currentTasks.forEach {
            if $0.id != taskId {
                newTasks.append($0)
            }
        }

        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filePath = documentsDirectory.appendingPathComponent("RecipeList").appendingPathExtension("json")
        if !FileManager.default.fileExists(atPath: filePath.path) {
            FileManager.default.createFile(atPath: filePath.path, contents: nil, attributes: nil)
        }

        guard let jsonData = try? JSONEncoder().encode(newTasks)
        else { return }

        do {
            try jsonData.write(to: filePath)

        } catch let error {
            NSLog("Hata : \(error)")
        }
    }
    
    func updateTask(_ task: TaskListItem) {
        var newTasks: [TaskListItem] = []
        let currentTasks = readTasks()
        currentTasks.forEach {
            if $0.id == task.id {
                newTasks.append(task)
            } else {
                newTasks.append($0)
            }
        }

        guard let jsonData = try? JSONEncoder().encode(newTasks)
        else { return }

        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let filePath = documentsDirectory.appendingPathComponent("TaskList").appendingPathExtension("json")
        if !FileManager.default.fileExists(atPath: filePath.path) {
            FileManager.default.createFile(atPath: filePath.path, contents: nil, attributes: nil)
        }
    }
}
