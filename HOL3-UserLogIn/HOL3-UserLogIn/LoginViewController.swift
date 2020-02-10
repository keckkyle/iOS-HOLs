//
//  LoginViewController.swift
//  HOL3-UserLogIn
//
//  Created by Kyle Keck on 2/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitLogIn(_ sender: Any) {
        if isEmail(emailTextField) {
            showAlert("Invalid Email", "Please provide a valid email", self)
        } else if passwordTextField.text! == "" {
            showAlert("Invalid Password", "A password must be provided", self)
        }
    }
    
}
