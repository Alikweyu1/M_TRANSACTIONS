//
//  withdrawTableViewCell.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 08/04/2023.
//

import UIKit

class withdrawTableViewCell: UITableViewCell {
    
    @IBOutlet weak var AMOUNT: UILabel!
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var CODE: UILabel!
    var withdrawlist:withdrawsList?{
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
        guard let withdrawlist else {
            self.name.text = "No data"
            return
            
        }
        print(withdrawlist)
        self.name.text = withdrawlist.name
        self.date.text = "Date:"+" " + "\(withdrawlist.date)"
        self.AMOUNT.text = ""+" " + "Ksh \(withdrawlist.amount)"
        self.CODE.text = "code"+" " + "\(withdrawlist.transactionCode)"
        self.CODE.isHidden = true
    }
}
