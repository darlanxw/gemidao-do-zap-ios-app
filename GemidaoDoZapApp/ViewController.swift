//
//  ViewController.swift
//  GemidaoDoZapApp
//
//  Created by MacDD02 on 09/08/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txFrom:UITextField!
    @IBOutlet var txTo:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func callNow (){
        
    }
    
    @IBAction func create(){
        openUrl(urlString: "https://api2.totalvoice.com.br/painel/signup.php")
    }
    
    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
   
}

