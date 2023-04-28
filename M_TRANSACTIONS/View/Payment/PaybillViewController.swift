//
//  PaybillViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 23/04/2023.
//

import UIKit
import Reachability
class PaybillViewController: UIViewController {
    @IBOutlet weak var TransferView:UIView!
    @IBOutlet weak var amount:UITextField!
    @IBOutlet weak var PaybilNumber:UITextField!
    @IBOutlet weak var Account:UITextField!
    @IBOutlet weak var pin:UITextField!
    @IBOutlet weak var Transfer:UIButton!
    @IBOutlet weak var TransferQR:UIButton!
    var tokens = UserDefaults.standard.string(forKey: "token")
    var Mobile = UserDefaults.standard.string(forKey: "phonenumber")
    var reachability = try? Reachability()
    var fromPhone:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        Config()
    }
    @IBAction func closeQRTapped(_ sender:UIButton){
        self.dismiss(animated: true)
    }
    @IBAction func TransferQRTapped(_ sender:UIButton){
        
    }
    @IBAction func TransferTapped(_ sender:UIButton){
        do{
           let reachability = try Reachability.init()
        }catch{
            print("error on starting notifiar")
        }
        if((reachability?.connection) != .unavailable){
            do{
                let parameter = CreateParameter()
                print(parameter)
                guard let url = URL(string: APIURL.API.payBill) else{
                    return
                }
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content_Type")
                request.httpBody = try JSONSerialization.data(withJSONObject: parameter)
                URLSession.shared.dataTask(with: request){(data,response,error) in
                    if let error = error{
                        print("check this error\(error.localizedDescription)")
                    }else{
                        let jsonData = try? JSONDecoder().decode(MtransferApi.self, from: data!)
                        let status = jsonData?.status
                        let message = jsonData?.message
                        let amount = jsonData?.data?.amount
                        let receivedby = jsonData?.data?.RecievedBy
                    }
                }.resume()
            }catch{
                print("error at \(error.localizedDescription)")
            }
        }else{
            errorAlertMessage()
        }
    }
    
}
extension PaybillViewController{
    func Config(){
        self.TransferView.layer.cornerRadius = 20
        self.TransferView.layer.masksToBounds = true
        self.TransferView.layer.shadowColor = UIColor.black.cgColor
        self.TransferView.layer.shadowOpacity = 1
      
        self.amount.addBottomBorderLinewithColor(Color: .black, width: 1)
        self.pin.addBottomBorderLinewithColor(Color: .black, width: 1)
        self.PaybilNumber.addBottomBorderLinewithColor(Color: .black, width: 1)
        self.Account.addBottomBorderLinewithColor(Color: .black, width: 1)
    }
    func CreateParameter()-> [String:Any]{
        var transfer = [String:Any]()
        transfer["amount"] = amount.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        transfer["token"] = tokens
        transfer["userPhone"] = Mobile
        transfer["paybilNumber"] = PaybilNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        transfer["accountNumber"] = Account.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        transfer["pin"] = pin.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        return transfer
    }
    func errorAlertMessage(){
        let alert = UIAlertController(title: "Error", message: "Something went wrong. Please check your internet connection and try again", preferredStyle: .alert)
        let retry = UIAlertAction(title: "Retry", style: UIAlertAction.Style.cancel) { [weak self] _ in
            guard let self = self else { return }
            if self.reachability!.connection == .unavailable {
                // do nothing, the alert stays on the screen
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
        
        alert.addAction(retry)
        
        present(alert, animated: true, completion: nil)
    }
}
