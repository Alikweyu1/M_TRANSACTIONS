//
//  TransactionTableViewCell.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 07/04/2023.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
   
    @IBOutlet weak var tableviews: UIView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var transactedTo: UILabel!
    var transaction:Transaction?{
        didSet{
            transactionDetailConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        tableviews.addBordre(color: .white, with: 0)
        //tableviews.round()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func transactionDetailConfiguration(){
        guard let transaction else{
            self.transactedTo.text = "No Transaction"
            return
            
        }
        //
        DispatchQueue.main.async {
            self.transactedTo.text = transaction.name
            self.amount.text = "Ksh\(transaction.amount)"
            self.date.text = transaction.date
            self.type.text = transaction.types.recieved?.phoneNumber
        }
    }
    
}
