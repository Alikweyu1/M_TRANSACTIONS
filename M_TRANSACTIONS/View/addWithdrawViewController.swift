//
//  addWithdrawViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 08/04/2023.
//

import UIKit
import MBProgressHUD
class addWithdrawViewController: UIViewController {
   private var viewModel = UserModel()
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
        
        
        pinnumbertext.isHidden = false
        pinLbl.isHidden = false
       amountlbl.isHidden = true
        amounttxt.isHidden = true
        nextbtn3.isHidden = false
        next4.isHidden = true
        //nextbtn1.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textChanged(_ sender: Any) {
       // nextbtn1.isHidden = false
    }
    
    @IBAction func close1(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func QRTapped(_ sender: Any) {
        print("Tapped")
    }
    
    
    
    
    
    @IBAction func nextBtn3(_ sender: Any) {
       
        nextbtn3.isHidden = true
        next4.isHidden = false
        amountlbl.isHidden = false
        amounttxt.isHidden = false
        pinnumbertext.isHidden = true
        pinLbl.isHidden = true
    }
    
    @IBAction func next4(_ sender: Any) {
        
        let withdraw = AddWithdraw(amount: amounttxt.text!, pin: pinnumbertext.text!)
        viewModel.addWithdraw(parameters: withdraw)
        
       
       
        
    }
}
extension addWithdrawViewController{
    func Designing(){
        
        amounttxt.addBottomBorderLinewithColor(Color: .green, width: 1)
        pinnumbertext.addBottomBorderLinewithColor(Color: .green, width: 1)
    }
}
