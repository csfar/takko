//
//  EmployeeViewModel.swift
//  takko
//
//  Created by Artur Carneiro on 17/02/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation

protocol EmployeeViewModelDelegate: class {
    func reloadUI()
}

final class EmployeeViewModel {

    private let coordinator: MainCoordinator
    private var model: [EmployeeModel] {
        didSet {
            delegate?.reloadUI()
        }
    }

    weak var delegate: EmployeeViewModelDelegate?
    
    init(coordinator: MainCoordinator, model: [EmployeeModel]) {
        self.coordinator = coordinator
        self.model = model
    }

    public func name(at index: Int) -> String {
        return model[index].name
    }

    public func cargo(at index: Int) -> String {
        return model[index].cargo
    }

    public func numberOfRows() -> Int {
        return model.count
    }
}
