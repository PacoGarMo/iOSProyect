//
//  ProductBakery.swift
//  PruebaAutolayout
//
//  Created by Francisco García Molina on 19/2/18.
//  Copyright © 2018 Francisco García Molina. All rights reserved.
//

import Foundation

class ProductBakery{
    var id: String?
    var idfamily: String?
    var product: String?
    var price: Double?
    var description: String?
    
    init(){}
    
    init(id: String, idfamily: String, product: String, price: Double, description: String){
        self.id = id
        self.idfamily = idfamily
        self.product = product
        self.price = price
        self.description = description
    }
}
