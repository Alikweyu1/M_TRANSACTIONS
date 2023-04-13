//
//  SendingViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 08/04/2023.
//

import UIKit

class SendingViewController: UIViewController {

    @IBOutlet weak var next4: UIButton!
    @IBOutlet weak var amountlbl: UILabel!
    @IBOutlet weak var amounttxt: UITextField!
    
    @IBOutlet weak var pinnumbertext: UITextField!
    @IBOutlet weak var pinLbl: UILabel!
    @IBOutlet weak var StoreNoLbl: UILabel!
    @IBOutlet weak var agentNoLbl: UILabel!
    
    @IBOutlet weak var nextbtn3: UIButton!
    @IBOutlet weak var nextbtn2: UIButton!
    @IBOutlet weak var nextbtn1: UIButton!
    @IBOutlet weak var storeNumber: UITextField!
    @IBOutlet weak var agentNumber: UITextField!
    @IBOutlet weak var qrreader: UIImageView!
    @IBOutlet weak var closeBtn1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        Designing()
        storeNumber.isHidden = true
        nextbtn2.isHidden = true
        StoreNoLbl.isHidden = true
        pinnumbertext.isHidden = true
        pinLbl.isHidden = true
       amountlbl.isHidden = true
        amounttxt.isHidden = true
        nextbtn3.isHidden = true
        next4.isHidden = true
    }
    @IBAction func next1(_ sender: Any) {
      
        nextbtn1.isHidden = true
        nextbtn2 .isHidden = false
        agentNumber.isHidden = true
        agentNoLbl.isHidden = true
        storeNumber.isHidden = false
        StoreNoLbl.isHidden = false
        
    }
    @IBAction func nextBtn2(_ sender: Any) {
       
        nextbtn2.isHidden = true
        nextbtn3.isHidden = false
        storeNumber.isHidden = true
        StoreNoLbl.isHidden = true
        amounttxt.isHidden = false
        amountlbl.isHidden = false
        
    }
    
    @IBAction func nextBtn3(_ sender: Any) {
       
        nextbtn3.isHidden = true
        next4.isHidden = false
        amountlbl.isHidden = true
        amounttxt.isHidden = true
        pinnumbertext.isHidden = false
        pinLbl.isHidden = false
    }
    
    @IBAction func next4(_ sender: Any) {
        let withdraw = AddWithdraw(agentNumber: agentNumber.text!, storeNimber: storeNumber.text!, amount: amounttxt.text!, pin: pinnumbertext.text!)
        //viewModel.addWithdraw(parameters: withdraw)
        
       
       
        
    }

    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func qrReader(_ sender: Any) {
    }
    @IBAction func taped(_ sender: Any) {
    }
    @IBAction func addsendpayment(_ sender: Any) {
        print("taaped")
    }
    @IBAction func addsentbtnTapped(_ sender: Any) {
        print("taaped")
        performSegue(withIdentifier: "sending", sender: self.view)
    }
}
extension SendingViewController{
    func Designing(){
        agentNumber.addBottomBorderLinewithColor(Color: .green, width: 1)
        storeNumber.addBottomBorderLinewithColor(Color: .green, width: 1)
        amounttxt.addBottomBorderLinewithColor(Color: .green, width: 1)
        pinnumbertext.addBottomBorderLinewithColor(Color: .green, width: 1)
    }
}
