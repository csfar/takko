//
//  LoginViewController.swift
//  takko
//
//  Created by Artur Carneiro on 14/02/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {

    private lazy var loginLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var passwordLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var loginTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var passwordTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var loginButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var stack: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let viewModel: LoginViewModel


    init(viewModel: LoginViewModel ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.delegate = self

        loginLabel.text = "Login"
        passwordLabel.text = "Password"

        loginTextField.placeholder = "Login"
        loginTextField.autocapitalizationType = .none

        passwordTextField.placeholder = "Password"
        passwordTextField.autocapitalizationType = .none

        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .red
        loginButton.addTarget(self, action: #selector(login), for: .touchDown)

        stack.addArrangedSubview(loginLabel)
        stack.addArrangedSubview(loginTextField)
        stack.addArrangedSubview(passwordLabel)
        stack.addArrangedSubview(passwordTextField)
        stack.addArrangedSubview(loginButton)

        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.axis = .vertical

        view.addSubview(stack)

        stack.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 400).isActive = true
        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }

    @objc private func login() {
        viewModel.login = loginTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""
        viewModel.presentEmployeesScreen()
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func reject() {
        print("Login rejeitado!")
    }


}
