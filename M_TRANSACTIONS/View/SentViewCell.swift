//
//  SentViewCell.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 08/04/2023.
//

import UIKit

class SentViewCell: UITableViewCell {
    @IBOutlet weak var amount:UILabel!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var account:UILabel!
    @IBOutlet weak var date:UILabel!
    @IBOutlet weak var Ref:UILabel!
    var sentLists: SentList?{
        didSet { 
            sendConfig()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    func sendConfig(){
        guard let sentLists  else{
            return
        }
        print(sentLists)
        DispatchQueue.main.async {
            
            if (sentLists.sentType.phoneNumber != nil){
                self.name.text = "Name" + "\(sentLists.sentType.phoneNumber!.Name)"
                self.amount.text = "Amount Ksh \(sentLists.amount)"
                self.account.text = "Tel:" + "\(sentLists.sentType.phoneNumber!.phoneNumber)"
                self.date.text = "Date:" + "\(sentLists.date)"
                self.Ref.text = "Ref:" + "\(sentLists.transactionCode)"
                
            }else if (sentLists.sentType.bank != nil){
                self.name.text = "Bank name " + " " + "\(sentLists.sentType.bank!.accountName!)"
                self.amount.text = "Amount Ksh \(sentLists.amount)"
                self.account.text = "AccountN0." + " " + "\( sentLists.sentType.bank!.accountNumber!)"
                self.date.text = "Date:" + "\(sentLists.date)"
                self.Ref.text = "Ref:" + "\(sentLists.transactionCode)"
            }
        }
    }
    
}
