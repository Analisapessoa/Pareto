//
//  Constants.swift
//  PcpApp
//
//  Created by Ana Elisa Pessoa Aguiar on 26/09/16.
//  Copyright © 2016 Ana Elisa Pessoa Aguiar. All rights reserved.
//

import Foundation


class Product {
    var name: String
    var profit: Double
    var storage: Int
    var demand: Int
    
    var className: String
    
    init() {
        self.name = ""
        self.profit = 0
        self.storage = 0
        self.demand = 0
        self.className = ""
    }
    
    init(name: String, profit: Double, storage: Int, demand: Int) {
        self.name = name
        self.profit = profit
        self.storage = storage
        self.demand = demand
        
        self.className = ""
    }
    
    //Calcula quanto cada produto está representando na receita da empresa em $$ -> demanda*lucro
    func value() -> Double {
        return self.profit * Double(self.demand)
    }
    
    //Calcula quanto que será o valor($$) do estoque de cada produto -> estoque*lucro
    func value2() -> Double {
        return self.profit * Double(self.storage)
    }
    
    
}
