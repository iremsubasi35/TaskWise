//
//  ToDoListDataController.swift
//  TaskWise
//
//  Created by Irem Subası on 28.03.2023.
//

import Foundation
import Combine

struct TaskListMemories {
    let aim: String
}
final class ToDoListDataController {
    private let fileManager: FileManager = .init()
    
    private(set) var myNotes = CurrentValueSubject<[TaskListMemories], Never>([])
    
    
    private var cancellables = Set<AnyCancellable>()
}
extension ToDoListDataController {
    func initialize(){
        let sampleTask = TaskListMemories.init(aim: "iremefknwlkfnlekdwnjldnejlnfbleşmlimqşrekand.lekşfiale,iwldfEöfmşlkenlkfneşlknfkenflnekşfnejbkfjdhnşfmlenmflh3oıfrlmfdknclheofjoş4ejiflşençfn djfbldhf")
                    self.myNotes.send([sampleTask])
    }
}
