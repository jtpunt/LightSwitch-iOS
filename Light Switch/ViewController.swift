//
//  ViewController.swift
//  Light Switch
//
//  Created by Jonathan Perry on 7/26/20.
//  Copyright © 2020 Jonathan Perry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var TJCR_Switch1: UISwitch!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func TJCR_Action1(_ sender: UISwitch) {
     
        if TJCR_Switch1.isOn{
            label.text = "is on";
        }else{
            label.text = "is off";
        }
    }
}

