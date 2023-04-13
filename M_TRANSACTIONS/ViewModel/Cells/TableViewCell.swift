//
//  TableViewCell.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 05/04/2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var amount: UILabel!
    var transactions:Transaction?{
        didSet { // Property Observer
            productDetailConfigurations()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func  productDetailConfigurations(){
        guard let transactions else {
            return
        }
        self.amount.text =  "ksh \(transactions.transactionType)"
       
    }
    
}
