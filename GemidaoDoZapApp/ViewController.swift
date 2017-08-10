//
//  ViewController.swift
//  GemidaoDoZapApp
//
//  Created by MacDD02 on 09/08/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UITableViewController {
    @IBOutlet var txFrom:UITextField!
    @IBOutlet var txTo:UITextField!
    @IBOutlet var txToken:UITextField!
    @IBOutlet var lbSending:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func callNow (){
        self.lbSending.text = "Enviando..."
        if let from = txFrom.text {
            if let to = txTo.text {
                if let token = txToken.text {
                    API.sendGemidao(token: token, to: to, from: from, completionHandler: {result in
                        switch result {
                        case .success:
                            self.lbSending.text = "ENVIADO COM SUCESSO!"
                        case .failure(let error):
                            self.lbSending.text = "DEU MERDA, NÃO FOI!"
                            print(error)
                        }
                    })
                }
            }
        }
    }
    
    @IBAction func create(){
        openUrl(urlString: API.signUpUrl)
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
