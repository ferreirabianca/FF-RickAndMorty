//
//  LoginViewController.swift
//  FF-RickAndMorty
//
//  Created by Bianca Ferreira on 27/12/23.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK: - Properties
    var viewModel: LoginViewModel?
    
    //MARK: - Private Properties
    private let spacing = Views.defaultSpacing
    private let buttonHeight = Buttons.defaultHeight
    
    //MARK: - Views
    lazy var emailTextfield: DefaultTextField = {
        let textField = DefaultTextField()
        textField.placeholder = "E-mail"
        textField.layer.borderWidth = 1
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextfield: DefaultTextField = {
        let textField = DefaultTextField()
        textField.placeholder = "Senha"
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    //MARK: - Private functions
    private func setupViews() {
        view.addSubview(emailTextfield)
        view.addSubview(passwordTextfield)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            emailTextfield.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emailTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing),
            emailTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing),
            emailTextfield.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: spacing),
            passwordTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing),
            passwordTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing),
            passwordTextfield.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            signInButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: spacing),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing),
            signInButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: spacing),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing),
            signUpButton.heightAnchor.constraint(equalToConstant: buttonHeight),
        ])
    }
}

