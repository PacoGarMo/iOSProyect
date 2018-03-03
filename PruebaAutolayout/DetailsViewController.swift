//
//  DetailsViewController.swift
//  PruebaAutolayout
//
//  Created by Francisco García Molina on 22/2/18.
//  Copyright © 2018 Francisco García Molina. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var labelNameProduct: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    @IBOutlet weak var btnCard: UIButton!
    
    var productObject: ProductBakery? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelNameProduct.text = productObject?.name
        labelCategory.text = productObject?.category
        labelPrice.text = String(describing: productObject?.price)
        
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: labelDescription.bottomAnchor).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
