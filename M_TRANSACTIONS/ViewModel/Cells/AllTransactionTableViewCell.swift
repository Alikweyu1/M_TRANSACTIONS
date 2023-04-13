//
//  AllTransactionTableViewCell.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 06/04/2023.
//

import UIKit

class AllTransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var counting: UILabel!
    @IBOutlet weak var transactionType: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var recievedName: UILabel!
    var transaction:Transaction?{
        didSet{
            userTransactionConfiguration()
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
    func  userTransactionConfiguration(){
        guard  (transaction != nil) else { return }
        //recievedName.text = "ksh \()"
        print(transaction)
    }
    
}
