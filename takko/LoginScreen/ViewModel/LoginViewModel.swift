//
//  LoginViewModel.swift
//  takko
//
//  Created by Artur Carneiro on 14/02/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate: class {
    func reject()
}

final class LoginViewModel {

    private let coordinator: MainCoordinator
    private var model: LoginModel

    weak var delegate: LoginViewModelDelegate?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.model = LoginModel(login: "", password: "")
    }

    public var password: String = ""
    public var login: String = ""

    public func presentEmployeesScreen() {
        if password == "admin" && login == "admin" {
            coordinator.showEmployeeScreen()
        } else {
            delegate?.reject()
        }
    }
}
