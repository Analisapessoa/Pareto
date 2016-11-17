//
//  Singleton.swift
//  PcpApp
//
//  Created by Ana Elisa Pessoa Aguiar on 07/11/16.
//  Copyright © 2016 Ana Elisa Pessoa Aguiar. All rights reserved.
//

import Foundation

class Singleton {
     static let instance = Singleton()
    
    var products = [Product]()
    
    //Calcula a receita total da empresa -> soma da demanda*lucro de todos os produtos
    func calculateTotalValor() -> Double {
        return products.reduce(0.0, {$0 + $1.value()})
        //        return products.reduce(0.0, {$0 + $1.value()})
    }
}
