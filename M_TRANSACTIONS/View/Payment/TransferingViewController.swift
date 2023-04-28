//
//  TransferingViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 23/04/2023.
//

import UIKit
import Reachability
import MBProgressHUD
class TransferingViewController: UIViewController {
    @IBOutlet weak var TransferView:UIView!
    @IBOutlet weak var amount:UITextField!
    @IBOutlet weak var PhoneNumber:UITextField!
    @IBOutlet weak var pin:UITextField!
    @IBOutlet weak var Transfer:UIButton!
    @IBOutlet weak var TransferQR:UIButton!
    var tokens = UserDefaults.standard.string(forKey: "token")
    var Mobile = UserDefaults.standard.string(forKey: "phonenumber")
    var fromPhone:String?
    var token:String?
    let reachability = try? Reachability()
    override func viewDidLoad() {
        super.viewDidLoad()
configaration()
        
    }
    
    @IBAction func TransferQRTapped(_ sender:UIButton){
        
    }
    @IBAction func closeQRTapped(_ sender:UIButton){
        self.dismiss(animated: true)
    }
    @IBAction func TransferTapped(_ sender:UIButton){
        do{
           let reachability = try Reachability.init()
        }catch{
            print("error on starting notifiar")
        }
        if((reachability?.connection) != .unavailable){
            let transparentBlack = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            let loadingindicator = MBProgressHUD.showAdded(to: self.view, animated: true)
            loadingindicator.backgroundColor = transparentBlack
            loadingindicator.label.text = "Wait....."
            do{
               
                
                let parameter = CreateParameter()
                print(parameter)
                guard let url = URL(string: APIURL.API.MTransfer) else{
                    return
                }
                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("Application/Json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try JSONSerialization.data(withJSONObject: parameter)
                 token = tokens
                request.addValue("application/json", forHTTPHeaderField: "Accept")
                request.setValue("Bearer  \(token!)", forHTTPHeaderField: "Authorization")

                URLSession.shared.dataTask(with: request){(data,response,error) in
                   
                    
                  
                   
                    if let error = error{
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Fail", message: error.localizedDescription, preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel,handler: { action in
                                loadingindicator.hide(animated: true)
                            }))
                           
                        }
                        print("check this error\(error.localizedDescription)")
                    }else{
                        DispatchQueue.main.async { [self] in
                            amount.text = ""
                            PhoneNumber.text = ""
                            pin.text = ""
                            loadingindicator.hide(animated: true)
                        }
                        let jsonData = try? JSONDecoder().decode(MtransferApi.self, from: data!)
                        let status = jsonData?.status
                        let message = jsonData?.message
                        //let amount = jsonData?.data?.amount
                        let receivedby = jsonData?.data?.RecievedBy
                        DispatchQueue.main.async {
                            let alart = UIAlertController(title: "Successful!!", message:" ksh\(self.amount.text!) was successful transfered to \(self.PhoneNumber.text!)",  preferredStyle: .alert)
                            alart.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel,handler: { action in
                                
                            }))
                        }
                        
                    }
                }.resume()
            }catch{
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Fail", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel,handler: { action in
                        loadingindicator.hide(animated: true)
                    }))
                   
                }
                print("error at \(error.localizedDescription)")
            }
        }else{
            errorAlertMessage()
        }
    }

}
extension TransferingViewController{
    func configaration(){
        self.TransferView.layer.cornerRadius = 20
        self.TransferView.layer.masksToBounds = true
        self.TransferView.layer.shadowColor = UIColor.black.cgColor
        self.TransferView.layer.shadowOpacity = 1
      
        self.amount.addBottomBorderLinewithColor(Color: .black, width: 1)
        self.pin.addBottomBorderLinewithColor(Color: .black, width: 1)
        self.PhoneNumber.addBottomBorderLinewithColor(Color: .black, width: 1)
    }
    func CreateParameter()-> [String:Any]{
        var transfer = [String:Any]()
        _ = UserDefaults.standard.string(forKey: "token")
        transfer["transactionAmount"] = amount.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        transfer["senderAccountNumber"] = Mobile
        transfer["receiverAccountNumber"] = PhoneNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        transfer["pin"] = pin.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        transfer["token"] = tokens
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
