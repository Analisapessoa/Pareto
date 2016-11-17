//
//  MasterTableViewController.swift
//  PcpApp
//
//  Created by Ana Elisa Pessoa Aguiar on 21/09/16.
//  Copyright © 2016 Ana Elisa Pessoa Aguiar. All rights reserved.
//

import UIKit

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

class MasterTableViewController: UITableViewController {
    
//    var products = [Product]()         //vetor dos produtos
    var storageValor = Double()        //valor total do estoque (estoque * lucro)
    var percent = Double()             //% do valor do produto em relação ao valor total ((demanda*lucro)/soma dos valores)
    var totalValor = Double()          //valor total do produto (demanda * lucro)
    var totalValorOfProduct = Double() //valor total do produto (demanda * lucro)
    var classProduct = String()        //classe do produto (tem q ser A, B ou C)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    
    func reload() {
        ordenarDESC()
        totalValor = Singleton.instance.calculateTotalValor()
        calculateClassOfProduct()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.instance.products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Product") as! MasterTableViewCell
        let product = Singleton.instance.products[indexPath.row]
        
        let x = Double(product.value() / totalValor).roundTo(places: 3)
        
        cell.productName.text = product.name
        cell.demandValor.text = "\((product.value()))"
        cell.storageValor.text = "\((product.value2()))"
        cell.percentOfValor.text = "\(x)"
        cell.classOfProduct.text = product.className

        return cell
    }
    
    //Coloca o array por ordem decrescente segundo o $$ da demanda (demand * profit)  --->   DESC by demand * profit
    func ordenarDESC() {
        Singleton.instance.products.sort(by: { (a,b) -> Bool in
            return Double(a.demand) * a.profit > Double(b.demand) * b.profit
        })
    }
    
    //Falará se o produto é Classe A, B ou C -> soma das % até 80%, o produto é A, se estiver maior que 80% e menor que 90% é B, quando maior de 90% o produto é classe C
    func calculateClassOfProduct() {
        var totalPercent: Double = 0
        for (i,product) in Singleton.instance.products.enumerated() {
//        for (i,product) in products.enumerated() {
            totalPercent = totalPercent + (product.value() / totalValor)
            
            if totalPercent < 0.8 || (Singleton.instance.products.first! === product) {
//            if totalPercent < 0.8 || (products.first! === product) {
                product.className = "A"
            } else if (totalPercent > 0.8 && totalPercent < 0.9) || Singleton.instance.products[i-1].className == "A" {
//            else if (totalPercent > 0.8 && totalPercent < 0.9) ||  products[i-1].className == "A" {
                product.className = "B"
            } else {
                product.className = "C"
            }
        }
    }
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? ProductDetailViewController {
            if let indexpath = self.tableView.indexPathForSelectedRow {
                vc.index = ((indexpath as NSIndexPath?)?.row)!
            }
        }
     }

}
