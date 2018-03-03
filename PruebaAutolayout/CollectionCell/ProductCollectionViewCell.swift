//
//  ProductCollectionViewCell.swift
//  PruebaAutolayout
//
//  Created by Francisco García Molina on 16/2/18.
//  Copyright © 2018 Francisco García Molina. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTilte: UILabel!
    @IBOutlet weak var productDetails: UIButton!
    
    var callBack: callBack? = nil
    var indexPath : IndexPath!

    @IBAction func btnDetails(_ sender: UIButton) {
        callBack?.productDetails(indexPath: indexPath)
    }
}
