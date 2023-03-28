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
    
    init(viewModel: AddTaskViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
