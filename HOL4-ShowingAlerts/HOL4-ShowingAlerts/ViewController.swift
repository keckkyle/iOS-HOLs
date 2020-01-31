//
//  ViewController.swift
//  HOL4-ShowingAlerts
//
//  Created by Kyle Keck on 1/31/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showName(_ sender: Any) {
        let alert = UIAlertController(title: "What's your name?", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: {textField in textField.placeholder = "Input your name here"})
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {action in if let name = alert.textFields?.first?.text{ print("Your name: \(name)")}}))
        
        self.present(alert, animated: true)
        
    }
    
    
    @IBAction func Towel(_ sender: Any) {
        let alert = UIAlertController(title: "Did you bring a towel", message: "It is recommended you have a towel.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in print("Yay, you brought a towel")}))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

