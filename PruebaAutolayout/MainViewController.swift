//
//  MainViewController.swift
//  PruebaAutolayout
//
//  Created by Francisco Garcia Molina on 3/3/18.
//  Copyright © 2018 Francisco García Molina. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, callBack {

    //MARK: Properties
    @IBOutlet weak var mainControllerProduct: UICollectionView!
    
    @IBOutlet weak var mainCardButton: UIButton!
    @IBOutlet weak var mainTotalLabel: UILabel!
    
    let p1 = ProductBakery(name: "pan", category: "panaderia", price: 0.30)
    let p2 = ProductBakery(name: "palmera", category: "bolleria", price: 0.80)
    let p3 = ProductBakery(name: "panini", category: "pizza", price: 1.50)
    let p4 = ProductBakery(name: "croisant", category: "croisant", price: 0.60)
    
    var productArray = [ProductBakery]()
    var cardProduct = [CardBakery]()
    
    var totalPrice: Double = 0.0
    var send : ProductBakery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productArray.append(p1)
        productArray.append(p2)
        productArray.append(p3)
        productArray.append(p4)

        mainControllerProduct.delegate = self
        mainControllerProduct.dataSource = self
        
        self.view.addSubview(mainControllerProduct)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func productDetails(indexPath: IndexPath) {
        let cell : MainProductCollectionViewCell = mainControllerProduct!.cellForItem(at: indexPath) as! MainProductCollectionViewCell
        var name = cell.productTilteMain.text
        for product in productArray{
            if product.name == name{
                send = product
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let prodcutCell: MainProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainProductCell", for: indexPath) as! MainProductCollectionViewCell
        prodcutCell.productTilteMain.text = productArray[indexPath.row].name
        
        prodcutCell.indexPath = indexPath
        
        prodcutCell.callBack = self
        
        //style cell
        prodcutCell.layer.cornerRadius = 5
        
        return prodcutCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let prodcutCell: MainProductCollectionViewCell = collectionView.cellForItem(at: indexPath) as! MainProductCollectionViewCell
        
        //buscamos el producto por si se encuentre en el carro
        var added = false
        var product = ProductBakery()
        for productFiltered in productArray{
            if productFiltered.name == prodcutCell.productTilteMain.text{
                product = productFiltered
                for addedProduct in cardProduct{
                    if productFiltered.name == addedProduct.name{
                        added = true
                        addedProduct.amount = addedProduct.amount! + 1
                    }
                }
            }
            
        }
        
        if added == false {
            //añadimos al carro
            let newProduct = CardBakery(name: product.name!, category: product.category!, price: product.price!, amount:1)
            cardProduct.append(newProduct)
        }
        
        if cardProduct.isEmpty{
            mainTotalLabel.text = "Total 0€"
        }else{
            for priceProduct in cardProduct{
                totalPrice = totalPrice + (priceProduct.price! * Double(priceProduct.amount!))
            }
            
            mainTotalLabel.text = "Total " + String(totalPrice) + "€"
        }
        
        self.mainControllerProduct.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let detailsViewController = segue.destination as? DetailsViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        detailsViewController.productObject = send
    }

}
