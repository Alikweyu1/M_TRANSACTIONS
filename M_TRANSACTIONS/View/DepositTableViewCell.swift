//
//  DepositTableViewCell.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 10/04/2023.
//

import UIKit

class DepositTableViewCell: UITableViewCell {
    @IBOutlet weak var depositedname:UILabel!
    @IBOutlet weak var depositeddate:UILabel!
    @IBOutlet weak var depositedBankname:UILabel!
    @IBOutlet weak var depositedAccount:UILabel!
    @IBOutlet weak var amount:UILabel!
    var phoneNumner:String = ""
    var bank:String = ""
    var depositLists:deposited?{
        didSet{
        depositConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        depositedAccount.isHidden = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func  depositConfiguration(){
        guard let depositLists else{
            return
        }
        phoneNumner = "phoneNumber"
        if (depositLists.depositedType.phoneNumber != nil){
            depositedBankname.text =  "Tel"+" :" + "\( depositLists.depositedType.phoneNumber!)"
            depositedAccount.isHidden = true
            depositeddate.text = "Date" + ":" + "\(depositLists.date)"
            amount.text = "Amount Ksh\(depositLists.amount)"
            
        }else{
            DispatchQueue.main.async {
                self.depositedBankname.text = "Bank" + ":" + "\( depositLists.depositedType.bank!.accountName!)"
                self.depositedAccount.text = "Account" + ":" + "\(depositLists.depositedType.bank!.accountNumber!)"
                self.depositeddate.text = "Date" + ":" + "\(depositLists.date)"
                self.amount.text = "Amount Ksh\(depositLists.amount)"
                self.depositedAccount.isHidden = false
            }
        }
    }
    
}
