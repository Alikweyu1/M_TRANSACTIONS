//
//  RecievedListViewCell.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 10/04/2023.
//

import UIKit

class RecievedListViewCell: UITableViewCell {
    @IBOutlet weak var amount:UILabel!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var acount :UILabel!
    @IBOutlet weak var date:UILabel!
    var recievedList:Recieve?{
        didSet{
            RecievedConfig()
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
    func RecievedConfig(){
        guard let recievedList else{
            return
        }
        if (recievedList.recieved.phoneNumber != nil){
            self.name.text = recievedList.recieved.phoneNumber
            self.acount.isHidden = true
            self.amount.text = "Amount ksh\(recievedList.amount)"
            self.date.text = recievedList.date
        }else{
            self.name.text = recievedList.recieved.bank?.accountName
            self.acount.isHidden = false
            self.acount.text =  recievedList.recieved.bank?.accountNumber
            self.amount.text = "Amount ksh\(recievedList.amount)"
            self.date.text = recievedList.date
        }
    }
    
}
