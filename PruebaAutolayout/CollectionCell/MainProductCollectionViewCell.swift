//
//  MainProductCollectionViewCell.swift
//  PruebaAutolayout
//
//  Created by Francisco Garcia Molina on 3/3/18.
//  Copyright © 2018 Francisco García Molina. All rights reserved.
//

import UIKit

class MainProductCollectionViewCell: UICollectionViewCell {
    
    //MARK: Properties
    @IBOutlet weak var productImageMain: UIImageView!
    @IBOutlet weak var productTilteMain: UILabel!
    @IBOutlet weak var productDetailsMain: UIButton!
    
    var callBack: callBack? = nil
    var indexPath : IndexPath!
    
    @IBAction func btnDetailsMain(_ sender: UIButton) {
    }
}
