//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Marcos Roberto Lemos Veloso on 08/01/25.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.font = Typography.subHeading
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.font = Typography.input
        text.layer.cornerRadius = Metrics.little
        text.layer.borderColor = Colors.borderBase.cgColor
        text.layer.borderWidth = 1
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        text.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        text.leftViewMode = .always
        text.rightViewMode = .always
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "******"
        text.font = Typography.input
        text.layer.cornerRadius = Metrics.little
        text.layer.borderColor = Colors.borderBase.cgColor
        text.layer.borderWidth = 1
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        text.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        text.leftViewMode = .always
        text.rightViewMode = .always
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("login.button.title".localized, for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        let exampleGest = UITapGestureRecognizer(target: self, action: #selector(exampleTaped))
        titleLabel.addGestureRecognizer(exampleGest)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func exampleTaped() {
        print("clicou na label")
    }
    
    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.medium
        
        addSubview(handleArea)
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)

        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
            handleArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.large),
            emailTextField.heightAnchor.constraint(equalToConstant: 56),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.large),
            passwordTextField.heightAnchor.constraint(equalToConstant: 56),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.large),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
