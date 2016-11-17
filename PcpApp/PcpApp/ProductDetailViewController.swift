//
//  ProductDetailViewController.swift
//  PcpApp
//
//  Created by Ana Elisa Pessoa Aguiar on 21/09/16.
//  Copyright © 2016 Ana Elisa Pessoa Aguiar. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var producNameTextField: UITextField!
    @IBOutlet weak var demandTextField: UITextField!
    @IBOutlet weak var profitTextField: UITextField!
    @IBOutlet weak var storageTextField: UITextField!
    
    @IBOutlet weak var classProduct: UILabel!
    @IBOutlet weak var demandValor: UILabel!
    @IBOutlet weak var percentOfValor: UILabel!
    
//    var products = Product()                              //vetor dos produtos
    var index = Int()
    var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        product = Singleton.instance.products[index]
        producNameTextField.text = product.name
        demandTextField.text = "\(product.demand)"
        profitTextField.text = "\(product.profit)"
        storageTextField.text = "\(product.storage)"
        
        let x = Double(product.value() / Singleton.instance.calculateTotalValor()).roundTo(places: 3)
        
        classProduct.text = product.className
        demandValor.text = "\((product.value()))"
        percentOfValor.text = "\(x)"
    }
    
    // MARK: - Buttons
    @IBAction func save(_ sender: AnyObject) {
        
        //Alerta
        if storageTextField.text == "" || profitTextField.text == "" || demandTextField.text == "" || producNameTextField.text == "" {
            let alerta: UIAlertController = UIAlertController (title: "Incompleto", message: "Você esqueceu de preencher algum dos campos. Por favor preencha todos. Caso algum seja Zero, coloque o número.", preferredStyle: .alert)
            
            let acao1: UIAlertAction = UIAlertAction (title: "OK", style: .default)
            {       action -> Void in print("Apareceu!!! ")     }
            
            alerta.addAction(acao1)
            
            self.present(alerta, animated: true, completion: nil)
        }
        
        guard let profit = Double(profitTextField.text!), let demand = Int(demandTextField.text!), let storage = Int(storageTextField.text!) else {
            let alerta: UIAlertController = UIAlertController (title: "Errado", message: "A demanda, o Lucro e o Estoque devem ser números", preferredStyle: .alert)
            
            let acao1: UIAlertAction = UIAlertAction (title: "OK", style: .default)
            
            alerta.addAction(acao1)
            
            self.present(alerta, animated: true, completion: nil)
            return
        }
        
        product.name = producNameTextField.text!
        product.demand = demand
        product.profit = profit
        product.storage = storage
        
        guard let vc = self.navigationController?.viewControllers.first as? MasterTableViewController else {
            return
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteProduct(_ sender: AnyObject) {
        Singleton.instance.products.remove(at: index)
        self.navigationController?.popViewController(animated: true)
    }

}
