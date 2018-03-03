//
//  CardBakery.swift
//  PruebaAutolayout
//
//  Created by Francisco García Molina on 1/3/18.
//  Copyright © 2018 Francisco García Molina. All rights reserved.
//

import Foundation

class CardBakery{
    var name: String?
    var category: String?
    var price: Double?
    var amount: Int?
    
    init(){
        
    }
    
    init(name: String, category: String, price: Double, amount: Int){
        self.name = name
        self.category = category
        self.price = price
        self.amount = amount
    }
}
