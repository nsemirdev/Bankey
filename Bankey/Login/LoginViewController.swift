//
//  ViewController.swift
//  Bankey
//
//  Created by Emir Alkal on 6.12.2022.
//

import UIKit

final class LoginViewController: UIViewController {

    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    let infoLabel1 = UILabel()
    let infoLabel2 = UILabel()
    
    var userName: String? {
        loginView.usernameTextField.text
    }
    
    var password: String? {
        loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        style()
        layout()
    }
}

extension LoginViewController {
    private func style() {
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 16
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        errorMessageLabel.text = "Hata"
        
        infoLabel1.translatesAutoresizingMaskIntoConstraints = false
        infoLabel1.text = "Bankey"
        infoLabel1.textAlignment = .center
        infoLabel1.font = .systemFont(ofSize: 35, weight: .heavy)

        
        infoLabel2.translatesAutoresizingMaskIntoConstraints = false
        infoLabel2.text = "Your premium source for all things banking!"
        infoLabel2.numberOfLines = 0
        infoLabel2.textAlignment = .center
        infoLabel2.font = .systemFont(ofSize: 21, weight: .light)
    }
    

    private func layout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(infoLabel2)
        view.addSubview(infoLabel1)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        NSLayoutConstraint.activate([
            infoLabel2.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -80),
            infoLabel2.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            infoLabel2.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            infoLabel1.bottomAnchor.constraint(equalTo: infoLabel2.topAnchor, constant: -24),
            infoLabel1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}


// MARK: - Actions

extension LoginViewController {
    @objc func signInTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let userName = userName, let password = password else { return }
        
        if userName.isEmpty || password.isEmpty {
            configureView(with: "Username / password cannot be blank")
        }
        
        if userName == "nsemirdev" && password == "12345" {
            signInButton.configuration?.showsActivityIndicator = true
        }
        
    }
    
    private func configureView(with message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
