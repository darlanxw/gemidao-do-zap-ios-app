//
//  User.swift
//  GemidaoDoZapApp
//
//  Created by MacDD02 on 10/08/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    var nome:String?
    var login:Dados?
    var senha:String?
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        nome    <- map["nome"]
        login   <- map["login"]
        senha   <- map["senha"]
    }
    
    init(nome: String, login:String, senha:String) {
        self.nome = nome
        self.login = login
        self.senha = senha
    }
}
