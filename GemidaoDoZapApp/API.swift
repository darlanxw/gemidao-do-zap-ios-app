//
//  API.swift
//  GemidaoDoZapApp
//
//  Created by MacDD02 on 10/08/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class API {
    static var signUpUrl:String = "https://api2.totalvoice.com.br/painel/signup.php"
    
    static func sendGemidao(token:String, to:String, from:String, completionHandler:@escaping (Result<Any>) -> ()) -> Void {
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
        //lbSending.isHidden = false
        
        Alamofire.request(url!, method: .post, parameters: jsonString, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                completionHandler(response.result)
            case .failure(let error):
                completionHandler(response.result)
                print(error)
            }
        }
    }
}
