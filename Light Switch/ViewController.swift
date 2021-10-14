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
        let urlString = "http://192.168.1.202:5000/outlet/gpio/2/status",
            urlString1 = "http://192.168.1.202:5000/outlet/gpio/3/status",
            urlString2 = "http://192.168.1.200:5000/outlet/gpio/2/status",
            urlString3 = "http://192.168.1.200:5000/outlet/gpio/3/status",
            urlString4 = "http://192.168.1.201:5000/outlet/gpio/2/status",
            urlString5 = "http://192.168.1.201:5000/outlet/gpio/3/status";
        
        
        makeStatusRequest(urlString: urlString, uiSwitch: TJCR_Switch1)
        makeStatusRequest(urlString: urlString1, uiSwitch: TJCR_Switch2)
        
        makeStatusRequest(urlString: urlString2, uiSwitch: TJLR_Switch1)
        makeStatusRequest(urlString: urlString3, uiSwitch: TJLR_Switch2)
        
        makeStatusRequest(urlString: urlString4, uiSwitch: LSLR_Switch1)
        makeStatusRequest(urlString: urlString5, uiSwitch: LSLR_Switch2)
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var TJCR_Switch1: UISwitch!
    @IBOutlet weak var TJCR_Switch2: UISwitch!
    
    
    @IBOutlet weak var TJLR_Switch1: UISwitch!
    @IBOutlet weak var TJLR_Switch2: UISwitch!
    
    @IBOutlet weak var LSLR_Switch1: UISwitch!
    @IBOutlet weak var LSLR_Switch2: UISwitch!
    
    func makeStatusRequest(urlString: String, uiSwitch: UISwitch){
        let url = URL(string: urlString)!;
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
            guard let data = data else { return }
            let strStatus = String(data: data, encoding: .utf8)!
            let boolStatus = (strStatus as NSString).boolValue
            uiSwitch.setOn(boolStatus, animated: true);
            print(strStatus)
        }
    }
    func makeToggleRequest(urlString: String){
        let url = URL(string: urlString)!;
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
            guard let data = data else { return }
        }
    }
    @IBAction func TJCR_Action1(_ sender: UISwitch) {
        let urlString = "http://192.168.1.202:5000/outlet/gpio/2/toggle";
        makeToggleRequest(urlString: urlString)
    }

    @IBAction func TJCR_Action2(_ sender: UISwitch) {
        let urlString = "http://192.168.1.202:5000/outlet/gpio/3/toggle";
        makeToggleRequest(urlString: urlString)
    }
    @IBAction func TJLR_Action1(_ sender: UISwitch) {
        let urlString = "http://192.168.1.200:5000/outlet/gpio/2/toggle";
        makeToggleRequest(urlString: urlString)
    }
    
    @IBAction func TJLR_Action2(_ sender: UISwitch) {
        let urlString = "http://192.168.1.200:5000/outlet/gpio/3/toggle";
        makeToggleRequest(urlString: urlString)
    }
    
    @IBAction func LSLR_Action1(_ sender: UISwitch) {
        let urlString = "http://192.168.1.201:5000/outlet/gpio/2/toggle";
        makeToggleRequest(urlString: urlString)
    }
    @IBAction func LSLR_Action2(_ sender: UISwitch) {
        let urlString = "http://192.168.1.201:5000/outlet/gpio/3/toggle";
        makeToggleRequest(urlString: urlString)
    }
}

