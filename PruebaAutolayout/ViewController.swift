//
//  ViewController.swift
//  PruebaAutolayout
//
//  Created by Francisco García Molina on 15/2/18.
//  Copyright © 2018 Francisco García Molina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, callBack{
    
    //MARK: Properties
    @IBOutlet weak var ProductCollectionView: UICollectionView!
    @IBOutlet weak var CategoryCollectionView: UICollectionView!
    
    @IBOutlet weak var btnCard: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    
    let p1 = ProductBakery(name: "pan", category: "panaderia", price: 0.30)
    let p2 = ProductBakery(name: "palmera", category: "bolleria", price: 0.80)
    let p3 = ProductBakery(name: "panini", category: "pizza", price: 1.50)
    let p4 = ProductBakery(name: "croisant", category: "croisant", price: 0.60)
    
    
    var categoryArray = ["panaderia", "bolleria", "pizza", "croisant"]
    var productArray = [ProductBakery]()
    var catSelectArray = [ProductBakery]()
    var cardProduct = [CardBakery]()
    
    var totalPrice: Double = 0.0
    var send : ProductBakery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        productArray.append(p1)
        productArray.append(p2)
        productArray.append(p3)
        productArray.append(p4)
        
        ProductCollectionView.delegate = self
        CategoryCollectionView.delegate = self
        
        ProductCollectionView.dataSource = self
        CategoryCollectionView.dataSource = self
        
        self.view.addSubview(ProductCollectionView)
        self.view.addSubview(CategoryCollectionView)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.ProductCollectionView{
            print("SelectCount: ", catSelectArray.count)
            
            return catSelectArray.count
            
        }
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.ProductCollectionView{
            let prodcutCell: ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
            print("paso: " + catSelectArray[indexPath.row].name!)
            prodcutCell.productTilte.text = catSelectArray[indexPath.row].name
            
            prodcutCell.indexPath = indexPath
            
            prodcutCell.callBack = self
            
            return prodcutCell
        } else {
            let categoryCell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
            categoryCell.categoryTitle.text = categoryArray[indexPath.row]
            
            print("categoria")
            
            return categoryCell
        }
    }
    
    func productDetails(indexPath: IndexPath) {
        let cell : ProductCollectionViewCell = ProductCollectionView!.cellForItem(at: indexPath) as! ProductCollectionViewCell
        var name = cell.productTilte.text
        for product in catSelectArray{
            if product.name == name{
                send = product
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Seleccion item")
        if collectionView == self.ProductCollectionView{
            let prodcutCell: ProductCollectionViewCell = collectionView.cellForItem(at: indexPath) as! ProductCollectionViewCell
            
            //buscamos el producto por si se encuentre en el carro
            var added = false
            var product = ProductBakery()
            for productFiltered in catSelectArray{
                if productFiltered.name == prodcutCell.productTilte.text{
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
                totalLabel.text = "Total 0€"
            }else{
                for priceProduct in cardProduct{
                    totalPrice = totalPrice + (priceProduct.price! * Double(priceProduct.amount!))
                }
                
                totalLabel.text = "Total " + String(totalPrice) + "€"
            }
            
            self.ProductCollectionView.reloadData()
            
        } else {
            let categoryCell: CategoryCollectionViewCell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
            catSelectArray.removeAll()
            print("CellCat: " + categoryCell.categoryTitle.text!, indexPath)
            for category in categoryArray{
                if categoryCell.categoryTitle.text == category{
                    print("Cat: " + category)
                    for product in productArray{
                        if product.category == category{
                            print("Product: " + product.name!)
                            catSelectArray.append(product)
                            print(catSelectArray.count)
                        }
                    }
                }
            }
            self.ProductCollectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let detailsViewController = segue.destination as? DetailsViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        detailsViewController.productObject = send
    }
    
}


