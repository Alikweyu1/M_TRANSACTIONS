//
//  SendingViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 08/04/2023.
//

import UIKit

class SendingViewController: UIViewController {

    @IBOutlet weak var phoneLabl:UILabel!
    @IBOutlet weak var phonetxt:UITextField!
    @IBOutlet weak var amountLabl:UILabel!
    @IBOutlet weak var amount:UITextField!
    @IBOutlet weak var tillLabl:UILabel!
    @IBOutlet weak var tillNumber:UITextField!
    @IBOutlet weak var pinLabl:UILabel!
    @IBOutlet weak var pintxt:UITextField!
    @IBOutlet weak var paybilNoLabl:UILabel!
    @IBOutlet weak var paybilNotxt:UITextField!
    @IBOutlet weak var AccountNoLabl:UILabel!
    @IBOutlet weak var AccountNotxt:UITextField!
    @IBOutlet weak var BankAccountNoLabl:UILabel!
    @IBOutlet weak var BankAccounttxt:UITextField!
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var Bt3: UIButton!
    @IBOutlet weak var Btn4: UIButton!
    @IBOutlet weak var Btn5: UIButton!
    @IBOutlet weak var Btn6: UIButton!
    @IBOutlet weak var Bt7: UIButton!
    @IBOutlet weak var Btn8: UIButton!
    @IBOutlet weak var qrreader: UIImageView!
    @IBOutlet weak var closeBtn1: UIButton!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var close2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        Designing()
        phonetxt.isHidden = true
        phoneLabl.isHidden = true
        amount.isHidden = true
        amountLabl.isHidden = true
        Btn1.isHidden = true
        Btn2.isHidden = true
        Bt3.isHidden = true
        Btn4.isHidden = true
        Btn5.isHidden = true
        BankAccounttxt.isHidden = true
        BankAccountNoLabl.isHidden = true
        tillLabl.isHidden = true
        tillNumber.isHidden = true
        paybilNotxt.isHidden = true
        paybilNoLabl.isHidden = true
        view2.isHidden = true
        Btn6.isHidden = true
        pintxt.isHidden = true
        pinLabl.isHidden = true
        
    }
    @IBAction func next1(_ sender: Any) {
      
        
        
    }
    @IBAction func nextBtn2(_ sender: Any) {
       
        
        
    }
    @IBAction func SentType(_ sender: UIButton) {
        view2.isHidden = false
        phonetxt.isHidden = false
        phoneLabl.isHidden = false
        amount.isHidden = true
        amountLabl.isHidden = true
        Btn1.isHidden = false
        Btn2.isHidden = true
        
        closeBtn1.isEnabled = false
        close2.isHidden = false
    }
    
    @IBAction func btn1Tapped(_ sender: Any) {
        print("1")
        Btn1.isHidden = true
        phonetxt.isHidden = true
        phoneLabl.isHidden = true
        amount.isHidden = false
        amountLabl.isHidden = false
        Btn2.isHidden = false
        
    }
    @IBAction func btn2Tapped(_ sender: Any) {
        print("2")
        amount.isHidden = true
        amountLabl.isHidden = true
        pintxt.isHidden = false
        pinLabl.isHidden = false
        Btn2.isHidden = true
        Bt3.isHidden = false
        DispatchQueue.main.async {
            self.Bt3.setTitle("Send", for: .normal)
        }
        
    }
    @IBAction func btn3Tapped(_ sender: Any) {
        print("3")
        //send money by phone number
        
    }
    @IBAction func btn4Tapped(_ sender: Any) {
        print("4")
        Btn4.isHidden = true
        Btn5.isHidden = false
    }
    @IBAction func btn5Tapped(_ sender: Any) {
        print("5")
    }
    @IBAction func btn6Tapped(_ sender: Any) {
        
    }
    @IBAction func btn7Tapped(_ sender: Any) {
    }
    @IBAction func btn8Tapped(_ sender: Any) {
    }
    
    @IBAction func next4(_ sender: Any) {
        //let withdraw = AddWithdraw( amount: amounttxt.text!, pin: pinnumbertext.text!)
        //viewModel.addWithdraw(parameters: withdraw)
        
       
       
        
    }

    @IBAction func close2(_ sender: UIButton) {
        closeBtn1.isEnabled = true
        phonetxt.isHidden = true
        phoneLabl.isHidden = true
        amount.isHidden = true
        amountLabl.isHidden = true
        Btn1.isHidden = true
        Btn2.isHidden = true
        close2.isHidden = true
        view2.isHidden = true
        
        
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func qrReader1(_ sender: Any) {
        print("tapped")
    }
    @IBAction func qrReader2(_ sender: Any) {
        print("tapped")
    }
    @IBAction func qrReader3(_ sender: Any) {
        print("tapped")
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
        view2.layer.cornerRadius = 10
        view2.layer.shadowOffset = CGSize(width: 0, height: 3)
        view2.layer.shadowColor = UIColor.black.cgColor
        view2.layer.shadowRadius = 10
        view2.layer.shadowOpacity = 1
        phonetxt.addBottomBorderLinewithColor(Color: .black, width: 1)
        amount.addBottomBorderLinewithColor(Color: .black, width: 1)
        pintxt.addBottomBorderLinewithColor(Color: .black, width: 1)
        //agentNumber.addBottomBorderLinewithColor(Color: .green, width: 1)
        //storeNumber.addBottomBorderLinewithColor(Color: .green, width: 1)
        //amounttxt.addBottomBorderLinewithColor(Color: .green, width: 1)
        //pinnumbertext.addBottomBorderLinewithColor(Color: .green, width: 1)
    }
}
