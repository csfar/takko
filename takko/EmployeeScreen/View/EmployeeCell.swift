//
//  EmployeeCell.swift
//  takko
//
//  Created by Artur Carneiro on 17/02/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation
import UIKit

final class EmployeeCell: UITableViewCell {

    public lazy var nameLabel: UILabel = {
        let nameLabel = UILabel(frame: .zero)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    public lazy var cargoLabel: UILabel = {
        let cargoLabel = UILabel(frame: .zero)
        cargoLabel.translatesAutoresizingMaskIntoConstraints = false
        return cargoLabel
    }()

    func setUpCell() {
        self.addSubview(nameLabel)
        self.addSubview(cargoLabel)

        self.separatorInset = .zero
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        cargoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cargoLabel.widthAnchor.constraint(equalToConstant: 125).isActive = true
        cargoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true


    }
}
