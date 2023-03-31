//
//  ToDoListDataController.swift
//  TaskWise
//
//  Created by Irem Subası on 28.03.2023.
//

import Foundation
import Combine

struct TaskListItem: Codable {
    let id : String
    let description: String
    
    enum CodingKeys: CodingKey {
        case id,description
    }
}

final class ToDoListDataController {
    private let fileManager: Storage = .init()
    
    private(set) var myNotes = CurrentValueSubject<[TaskListItem], Never>([])
    
    
    private var cancellables = Set<AnyCancellable>()
}
extension ToDoListDataController {
    func initialize(){
        let sampleTask = TaskListItem.init(id: "0", description: "iremefknwlkfnlekdwnjldnejlnfbleşmlimqşrekand.lekşfiale,iwldfEöfmşlkenlkfneşlknfkenflnekşfnejbkfjdhnşfmlenmflh3oıfrlmfdknclheofjoş4ejiflşençfn djfbldhf")
                    self.myNotes.send([sampleTask])
    }
}
