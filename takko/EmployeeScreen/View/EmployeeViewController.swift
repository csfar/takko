//
//  EmployeeScreen.swift
//  takko
//
//  Created by Artur Carneiro on 17/02/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation
import UIKit

final class EmployeeViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let viewModel: EmployeeViewModel

    init(viewModel: EmployeeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self

        view.addSubview(tableView)

        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true


    }

}


extension EmployeeViewController: EmployeeViewModelDelegate {
    func reloadUI() {
        tableView.reloadData()
    }
}

extension EmployeeViewController: UITableViewDelegate {

}

extension EmployeeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EmployeeCell()
        cell.nameLabel.text = viewModel.name(at: indexPath.row)
        cell.cargoLabel.text = viewModel.cargo(at: indexPath.row)
        cell.setUpCell()

        return cell
    }


}
