//
//  MasterTableViewCell.swift
//  PcpApp
//
//  Created by Ana Elisa Pessoa Aguiar on 21/09/16.
//  Copyright © 2016 Ana Elisa Pessoa Aguiar. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var demandValor: UILabel!
    @IBOutlet weak var storageValor: UILabel!
    @IBOutlet weak var percentOfValor: UILabel!
    @IBOutlet weak var classOfProduct: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
