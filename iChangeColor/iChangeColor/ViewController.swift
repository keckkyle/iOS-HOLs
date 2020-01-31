//
//  ViewController.swift
//  iChangeColor
//
//  Created by Kyle Keck on 1/30/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var blueButton: UIButton!
    @IBOutlet var yellowButton: UIButton!
    @IBOutlet var greenButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeColor(sender : UIButton) {
        if sender == blueButton {
            self.view.backgroundColor = UIColor.blue
        } else if sender == yellowButton {
            self.view.backgroundColor = UIColor.yellow
        } else if sender == greenButton {
            self.view.backgroundColor = UIColor.green
        }
    }


}

