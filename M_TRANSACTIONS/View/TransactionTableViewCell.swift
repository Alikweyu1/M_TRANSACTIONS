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
    var transact:[welcome2]?
    var transaction:welcome2?{
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
        DispatchQueue.main.async { [self] in
           print(transact)
            self.transactedTo.text = "\(transaction.data2.totalExpense)"
            /*
            self.transactedTo.text = transaction.data[0].receiverAccount
            if transaction.data[0].transactionType == "DEPOSIT" {
                self.type.text = transaction.data[0].transactionType
                self.date.text = transaction.data[0].transactionDate
                self.amount.text = "transaction.data?.TransactionAmount"
                self.transactedTo.text = transaction.data[0].receiverAccount
            }else if transaction.data[2].transactionType == "WITHDRAW"{
                self.type.text = transaction.data[0].transactionType
                self.date.text = transaction.data[0].transactionDate
            } else if transaction.data[0].transactionType == "SENDMONEY"{
                self.type.text = transaction.data[0].transactionType
                self.date.text = transaction.data[0].transactionDate
            } else if transaction.data[0].transactionType == "LIPABILL"{
                self.type.text = transaction.data[0].transactionType
                self.date.text = transaction.data[0].transactionDate
            }
            */
        }
    }
    
}
