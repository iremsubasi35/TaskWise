//
//  AddTaskVC.swift
//  TaskWise
//
//  Created by Irem Subası on 28.03.2023.
//

import Foundation
import UIKit
import Combine

final class AddTaskVC:UIViewController{
    private let viewModel: AddTaskViewModel
    private var cancellables = Set<AnyCancellable>()
    
    private let note: UITextField = {
        let note = UITextField()
        note.placeholder = "Note To Myself"
        note.textColor = .black
        note.backgroundColor = .clear
        note.translatesAutoresizingMaskIntoConstraints = false
      return note
    }()
    
    private let saveButton: UIButton = {
       let saveButton = UIButton()
        saveButton.setImage(UIImage(systemName: "tick"), for: .normal)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        return saveButton
    }()
    
    private let cancelButton: UIButton = {
       let cancelButton = UIButton()
        cancelButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        return cancelButton
    }()
    
    init(viewModel: AddTaskViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - SetupUI
extension AddTaskVC {
    private func setupUI(){
        view.addSubview(note)
        view.addSubview(saveButton)
        view.addSubview(cancelButton)
        
        note.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        note.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        note .trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        
        cancelButton.topAnchor.constraint(equalTo: note.bottomAnchor, constant: 12).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        saveButton.topAnchor.constraint(equalTo: note.bottomAnchor, constant: 12).isActive = true
        saveButton.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor, constant: 12).isActive = true
        saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: saveButton.widthAnchor).isActive = true
        
    }
}
