//
//  ViewController.swift
//  HOL6-USerDefaults
//
//  Created by Kyle Keck on 2/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //set outlets for textFields
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //create actions for buttons
    @IBAction func view(_ sender: Any) {
        let data = Defaults.getNameAndAddress()
        print(data.name)
        print(data.address)
    }
    
    @IBAction func add(_ sender: Any) {
        Defaults.save(name: nameTextField.text!, address: addressTextField.text!)
        nameTextField.text = ""
        addressTextField.text = ""
    }
    
    @IBAction func clear(_ sender: Any) {
        Defaults.clearUserData()
    }
}


//set up struct to contain user details
struct Defaults {
    static let (nameKey, addressKey) = ("name", "address")
    static let userSessionKey = "com.save.usersession"
    private static let userDefault = UserDefaults.standard
    
    struct UserDetails {
        let name: String
        let address: String
        init(_ json: [String:String]){
            self.name = json[nameKey] ?? ""
            self.address = json[addressKey] ?? ""
        }
    }
    
    //save function to set userDefaults for name and address keys
    static func save(name: String, address: String) {
        userDefault.set([nameKey: name, addressKey: address], forKey: userSessionKey)
    }
    
    //get details from userDefaults for userSessionKey
    static func getNameAndAddress() -> UserDetails {
        return UserDetails((userDefault.value(forKey: userSessionKey) as? [String:String]) ?? [:])
    }
    
    //clear user defaults for session key
    static func clearUserData() {
        userDefault.removeObject(forKey: userSessionKey)
    }

}
