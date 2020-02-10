//
//  myFunctions.swift
//  HOL3-UserLogIn
//
//  Created by Kyle Keck on 2/9/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import UIKit

func isEmail(_ email:UITextField) -> Bool{
    if email.text!.firstIndex(of: "@") == nil {
        return true
    }
    return false
}

func showAlert(_ title: String, _ message: String, _ controller: UIViewController){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    controller.present(alert, animated: true)
}
