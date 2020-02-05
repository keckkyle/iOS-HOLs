//
//  ViewController.swift
//  HOL5-PropertyList
//
//  Created by Kyle Keck on 2/4/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func getFruits(_ sender: Any) {
        let fruits: [String]? = getPlist(withName: "Fruit")
        
        showToastMessage(controller: self, list: fruits!, seconds: 5)
    }
    
    @IBAction func inputNewFruit(_ sender: Any) {
        inputFruitAlert(controller: self)
    }
    
    
    func getPlist(withName name:String) -> [String]? {
        if let path = Bundle.main.path(forResource: name, ofType: "plist"), let xml = FileManager.default.contents(atPath: path) {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
        }
        return nil
    }
    
    
    func showToastMessage(controller : UIViewController, list: [String] , seconds : Double) {
        
         let alert = UIAlertController(title: nil,message: "",preferredStyle: .alert)
        
        for item in list {
            alert.message! += item + "\n"
        }
        
        alert.view.backgroundColor = UIColor.white
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 50
        controller.present(alert, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds){
            alert.dismiss(animated: true)
        }
       
    }
    
    func inputFruitAlert(controller: UIViewController){
        let alert = UIAlertController(title: "Add Fruit", message: nil, preferredStyle: .alert)
        
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Add new item", style: .default, handler: {action in
            if let fruitInput = alert.textFields?.first?.text {
                self.addItem(newFruit: fruitInput)
            }
        }))
        
        controller.present(alert, animated: true)
    }
    

    func addItem(newFruit : String) {
        //let fruit = Fruit(item1: "Mango", item2: "Guava")
        var fruitList:[String]? = getPlist(withName: "Fruit")
        
        fruitList?.append(newFruit)

        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let path = Bundle.main.bundleURL.appendingPathComponent("Fruit.plist")
        //let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Fruit.plist")
        do {
            let data = try encoder.encode(fruitList)
            try data.write(to: path)
        } catch {print(error)}
    }
    
}

