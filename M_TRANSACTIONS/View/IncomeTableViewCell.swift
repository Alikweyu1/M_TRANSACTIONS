//
//  IncomeTableViewCell.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 07/04/2023.
//

import UIKit

class IncomeTableViewCell: UITableViewCell {

    @IBOutlet weak var expenses: UILabel!
    @IBOutlet weak var income: UILabel!
    var transaction:Transaction?{
        didSet{
            transactionDetailConfiguration()
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
    func transactionDetailConfiguration(){
        guard let transaction else{return}
        print(transaction)
        DispatchQueue.main.async {
            self.income.text = transaction.name
        }
    }
    
}
