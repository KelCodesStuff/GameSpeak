//
//  SettingsController.swift
//  GameSpeak
//
//  Created by Kelvin Reid on 5/21/19.
//  Copyright © 2019 KReid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class SettingsController: UIViewController {
    
//    var loginController: LoginController?
//    var messagesController: MessagesController?
//    var settingsController: SettingsController?
    
    // This is in the plist file
    let appVersionNumber = "CFBundleShortVersionString"
    let appBuildNumber = "CFBundleVersion"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // screen background color
        view.backgroundColor = UIColor(r: 10, g: 50, b: 160)
        
        versionLabel.text = getVersion()
        
        view.addSubview(saveButton)
        view.addSubview(profileImageView)
        view.addSubview(logoutButton)
        view.addSubview(versionLabel)
        
        setupSaveButton()
        setupProfileImageView()
        setuplogoutButton()
        setupVersionLabel()
        
        let newMessageimage = UIImage(named: "back_button")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: newMessageimage, style: .plain, target: self, action: #selector(handleBack))
        
    }
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "controller_1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        button.setTitle("Save", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 10, g: 50, b: 160), for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        
        return button
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 255, g: 255, b: 255)
        button.setTitle("Log Out", for: UIControl.State())
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(r: 10, g: 50, b: 160), for: UIControl.State())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 5
        
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        
        return button
    }()
    
    var versionLabel: UILabel = {
        let tf = UILabel()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.textAlignment = .left
        tf.textColor = UIColor(r: 255, g: 255, b: 255)
        return tf
    }()
    

    @objc func handleBack() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSave() {
        
    }
    
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginController = LoginController()
        loginController.settingsController = self
        present(loginController, animated: true, completion: nil)
    }
    
    func getVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary[appVersionNumber] as! String
        let build = dictionary[appBuildNumber] as! String
        
        return "Version: \(version) (\(build))"
    }
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        return tf
    }()

    
    func setupProfileImageView() {
        //need x, y, width, height constraints
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -12).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupSaveButton() {
        //need x, y, width, height constraints
        saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        saveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setuplogoutButton() {
        //need x, y, width, height constraints
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 250).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -200).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupVersionLabel() {
        //need x, y, width, height constraints
        versionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        versionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 300).isActive = true
        versionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40).isActive = true
        versionLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
