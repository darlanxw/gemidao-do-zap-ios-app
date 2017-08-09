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
        lbSending.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    @IBAction func callNow (){
        if let from = txFrom.text {
            if let to = txTo.text {
                if let token = txToken.text {
                    let headers: HTTPHeaders = [
                        "Content-Type": "application/json",
                        "Accept": "application/json",
                        "Access-Token": token
                    ]
                
                    
                    let urlAudio = url_audio(url: "https://github.com/haskellcamargo/gemidao-do-zap/raw/master/resources/gemidao.mp3")
                    let dados = Dados(acao: "audio", acao_dados: urlAudio)
                    let params = Gemidao(numeroDestino: to, dados: [dados], bina: from)
                    
                    let jsonString = params.toJSON()
                    print(jsonString)
                    let url = URL(string: "https://api.totalvoice.com.br/composto");
                    lbSending.isHidden = false
                
                    Alamofire.request(url!, method: .post, parameters: jsonString, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                        switch response.result {
                        case .success:
                            self.lbSending.text = "ENVIADO COM SUCESSO!"
                            print(response.result.value ?? "Não deu")
                        case .failure(let error):
                            self.lbSending.text = "DEU MERDA, NÃO FOI!"
                            print(error)
                        }
                    }
                }
                
            }
        }
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
