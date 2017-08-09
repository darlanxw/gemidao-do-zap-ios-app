//
//  File.swift
//  GemidaoDoZapApp
//
//  Created by MacDD02 on 09/08/17.
//  Copyright © 2017 darlandev. All rights reserved.
//

import Foundation
import ObjectMapper

class Gemidao : Mappable {
    var numero_destino:String?
    var dados:[Dados]?
    var bina:String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        numero_destino    <- map["numero_destino"]
        dados         <- map["dados"]
        bina      <- map["bina"]
    }
    
    init(numeroDestino: String, dados:[Dados], bina:String) {
        self.numero_destino = numeroDestino
        self.dados = dados
        self.bina = bina
    }
}

class Dados : Mappable {
    var acao:String?
    var acao_dados:url_audio?
    
    init(acao:String, acao_dados: url_audio) {
        self.acao = acao
        self.acao_dados = acao_dados
    }
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        acao    <- map["acao"]
        acao_dados         <- map["acao_dados"]
    }
}

class url_audio : Mappable {
    var url_audio:String?
    
    init(url: String) {
        self.url_audio = url
    }
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        url_audio    <- map["url_audio"]
    }
}
