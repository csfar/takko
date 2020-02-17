//
//  MainCoordinator.swift
//  takko
//
//  Created by Artur Carneiro on 17/02/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    
    func start() {
        let viewModel = LoginViewModel(coordinator: self)
        let vc = LoginViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }

    func showEmployeeScreen() {
        var empregados: [EmployeeModel] = []
        let artur = EmployeeModel(name: "Artur Santos de França Carneiro", cargo: "CEO")
        let cassia = EmployeeModel(name: "Cassia Barbosa", cargo: "CFO")
        let cacique = EmployeeModel(name: "Cacique", cargo: "CMO")

        empregados.append(artur)
        empregados.append(cassia)
        empregados.append(cacique)

        let viewModel = EmployeeViewModel(coordinator: self, model: empregados)

       let vc = EmployeeViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }
}

