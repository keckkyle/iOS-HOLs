//
//  ViewController.swift
//  Calculator
//
//  Created by Kyle Keck on 1/31/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var num0: UIButton!
    @IBOutlet weak var num1: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    @IBOutlet weak var num7: UIButton!
    @IBOutlet weak var num8: UIButton!
    @IBOutlet weak var num9: UIButton!
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var displayText: UITextField!
    var currentNum:Double = 0
    var firstNum:Double = 0
    var operation:String?
    var prevResult:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayText.text = "0"
    }

    @IBAction func updateDisplay(_ sender: UIButton) {
        let btnPressed:String = String(sender.tag)
        
        if currentNum == 0 {
            displayText.text = btnPressed
        } else {
            displayText.text = displayText.text! + btnPressed
        }
        
        currentNum = Double(displayText.text!) ?? 0
    }
    
    
    @IBAction func setOperator(_ sender: UIButton) {
        
        if operation != nil {
            doMath()
            firstNum = Double(displayText.text!) ?? 0
            currentNum = 0
        } else if prevResult != 0 && currentNum == 0 {
            firstNum = prevResult
            prevResult = 0
        } else {
            firstNum = currentNum
            currentNum = 0
        }
        
        operation = String(sender.titleLabel!.text!)
        
    }
    
    @IBAction func equate(_ sender: Any) {
        doMath()
        prevResult = Double(displayText.text!) ?? 0
        currentNum = 0
        firstNum = 0
        operation = nil
    }
    
    func doMath(){
        switch operation {
        case "+":
            displayText.text = String(firstNum + currentNum)
        case "-":
            displayText.text = String(firstNum - currentNum)
        case "×":
            displayText.text = String(firstNum * currentNum)
        case "÷":
            displayText.text = String(firstNum / currentNum)
        default:
            displayText.text = "0"
        }
    }
    
}

