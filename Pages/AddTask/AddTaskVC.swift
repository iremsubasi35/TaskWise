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
    
    private let note: UITextView = {
        let note = UITextView()
        note.textColor = .black
        note.backgroundColor = .white
        note.textAlignment = .left
        note.translatesAutoresizingMaskIntoConstraints = false
        return note
    }()
    

    @objc func saveAction(_ gestureRecognizer: UITapGestureRecognizer) {
        print("save")
        }
    
    @objc func cancelAction(_ gestureRecognizer: UITapGestureRecognizer) {
        print("cancel")
        }
    
    init(viewModel: AddTaskViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// MARK: - LifeCycle
extension AddTaskVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
// MARK: - SetupUI
extension AddTaskVC {
    private func setupUI(){
        title = "My Note"
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "doc.text"),
                         style: .done,
                         target: self,
                         action: #selector(saveAction(_:))),
         UIBarButtonItem(image: UIImage(systemName: "xmark"),
                        style: .done,
                        target: self,
                        action: #selector(cancelAction(_:)))
        ]
        
        navigationController?.navigationBar.tintColor = .black
        view.addSubview(note)
        
        note.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        note.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        note .trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        note.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0).isActive = true
        
    }
}
// MARK: - Listeners
extension ToDoListVC {
   private func addListeners(){
       
    }
}
