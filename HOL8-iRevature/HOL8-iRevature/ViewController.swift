//
//  ViewController.swift
//  HOL8-iRevature
//
//  Created by Kyle Keck on 2/6/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

struct Associate {
    var id:Int
    var name:String
    var photo:String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    let associates = [
        Associate(id: 1, name: "Wes", photo:""),
        Associate(id: 2, name: "Jeremy", photo:""),
        Associate(id: 3, name: "Dane", photo:""),
        Associate(id: 4, name: "Mark", photo:""),
        Associate(id: 5, name: "Kjay", photo:""),
        Associate(id: 6, name: "Nathan", photo:""),
        Associate(id: 7, name: "Kyle", photo:"")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        
        tableview.register(AssociateNameCell.self, forCellReuseIdentifier:
        "cellId")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //1
        return associates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //2
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! AssociateNameCell
        
        cell.dayLabel.text = associates[indexPath.row].name
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.lightGray
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let view:UIViewController = storyboard.instantiateViewController(withIdentifier: associates[indexPath.row].name)
        
        self.present(view, animated:true, completion:nil)
        
    }

}


class ThirtyDayCell:UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}


class AssociateNameCell: UITableViewCell {
    let cellView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Day 1"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(cellView)
        cellView.addSubview(dayLabel)
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo:self.topAnchor),
            cellView.rightAnchor.constraint(equalTo:self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo:self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo:self.bottomAnchor)
        ])
        
        dayLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        
    }
    
    
}
