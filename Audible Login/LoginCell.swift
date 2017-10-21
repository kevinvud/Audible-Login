//
//  LoginCell.swift
//  Audible Login
//
//  Created by PoGo on 10/21/17.
//  Copyright © 2017 PoGo. All rights reserved.
//

import UIKit

class LoginCell: UICollectionViewCell {
    
    let logoImageView: UIImageView = {
       let image = UIImageView(image: UIImage(named: "logo"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image

    }()
    
    let emailTextField: LeftPaddedTextField = {
        let textfield = LeftPaddedTextField()
        textfield.placeholder = "Enter Email"
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 1
        textfield.keyboardType = .emailAddress
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield

    }()
    
    let passwordTextField: LeftPaddedTextField = {
        let textfield = LeftPaddedTextField()
        textfield.placeholder = "Enter Password"
        textfield.layer.borderColor = UIColor.lightGray.cgColor
        textfield.layer.borderWidth = 1
        textfield.isSecureTextEntry = true
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
        
    }()
    
    let loginButton: UIButton = {
       let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.backgroundColor = UIColor.orange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
        
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logoImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        
        logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 180).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Fatal Error")
    }
    
    
}

class LeftPaddedTextField: UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    
    
}
