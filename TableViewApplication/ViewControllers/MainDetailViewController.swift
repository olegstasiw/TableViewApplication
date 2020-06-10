//
//  MainDatailViewController.swift
//  TableViewApplication
//
//  Created by mac on 10.06.2020.
//  Copyright © 2020 Oleg Stasiw. All rights reserved.
//

import UIKit

class MainDetailViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var values: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(values.name) \(values.surname)"
        numberLabel.text = "Phone: \(values.number)"
        emailLabel.text = "Email: \(values.email)"
    }
}
