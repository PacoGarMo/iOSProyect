//
//  ProductBakery.swift
//  PruebaAutolayout
//
//  Created by Francisco García Molina on 19/2/18.
//  Copyright © 2018 Francisco García Molina. All rights reserved.
//

import Foundation

class ProductBakery{
    var name: String?
    var category: String?
    var price: Double?
    
    init(){
        
    }
    
    init(name: String, category: String, price: Double){
        self.name = name
        self.category = category
        self.price = price
    }
}
