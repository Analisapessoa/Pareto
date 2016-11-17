//
//  ViewController.swift
//  PcpApp
//
//  Created by Ana Elisa Pessoa Aguiar on 21/09/16.
//  Copyright © 2016 Ana Elisa Pessoa Aguiar. All rights reserved.
//

import UIKit

class NewProductViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var demandTextField: UITextField!
    @IBOutlet weak var profitTextField: UITextField!
    @IBOutlet weak var storageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func saveProduct(_ sender: AnyObject) {
        
        //Alerta
        if storageTextField.text == "" || profitTextField.text == "" || demandTextField.text == "" || productNameTextField.text == "" {
            let alerta: UIAlertController = UIAlertController (title: "Incompleto", message: "Você esqueceu de preencher algum dos campos. Por favor preencha todos. Caso algum seja Zero, coloque o número.", preferredStyle: .alert)
            
            let acao1: UIAlertAction = UIAlertAction (title: "OK", style: .default)
            
            alerta.addAction(acao1)
            
            self.present(alerta, animated: true, completion: nil)
            return
        }
        guard let profit = Double(profitTextField.text!), let demand = Int(demandTextField.text!), let storage = Int(storageTextField.text!) else {
            let alerta: UIAlertController = UIAlertController (title: "Errado", message: "A demanda, o Lucro e o Estoque devem ser números", preferredStyle: .alert)
            
            let acao1: UIAlertAction = UIAlertAction (title: "OK", style: .default)
            
            alerta.addAction(acao1)
            
            self.present(alerta, animated: true, completion: nil)
            return
        }
        
        let name = productNameTextField.text!
        
        let product = Product(name: name, profit: profit, storage: storage, demand: demand)
        
        guard let vc = self.navigationController?.viewControllers.first as? MasterTableViewController else {
            return
        }
        
        Singleton.instance.products.append(product)
//        vc.products.append(product)
        
        self.navigationController?.popViewController(animated: true) 
        
    }
    
}

