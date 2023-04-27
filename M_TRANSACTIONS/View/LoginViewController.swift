//
//  LoginViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit
import Network
import Reachability
class LoginViewController: UIViewController,UITextFieldDelegate {
    var names = UserDefaults.standard.string(forKey: "balance")
    var lineColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    //otpView
    @IBOutlet weak var otpView: UIView!
    var phoneNumber:String?
    //createpasswordPage
    @IBOutlet weak var createpasswordPage: UIView!
    
    @IBOutlet weak var password1: UITextField!
    
    @IBOutlet weak var password2: UITextField!
    
    
   // otppage
    @IBOutlet weak var otppage: UIView!
    
    @IBOutlet weak var otpreset: UIButton!
    @IBOutlet weak var otpresend: UIButton!
    @IBOutlet weak var text4: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var receivedNumber: UILabel!
    
    
    
    //forgetpasswordpage
    @IBOutlet weak var forgetpasswordpage: UIView!
    @IBOutlet weak var loginpage: UIView!
    
    @IBOutlet weak var forgetPhonenumber: UITextField!
    
    
    //loginpage
    
    @IBOutlet weak var forgetview: UIView!
    @IBOutlet weak var loginview: UIView!
    
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var forgetbtn: UIButton!
    @IBOutlet weak var loginpassword: UITextField!
    @IBOutlet weak var loginphone: UITextField!
    var phoneNumberReceived:String?
    @IBOutlet weak var phonelbl: UILabel!
    var reachability = try? Reachability()
   var  usermodels = UserModels()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.forgetpasswordpage.isHidden = true
        self.otppage.isHidden = true
        self.createpasswordPage.isHidden = true
       
       
        print(names)
        let uname = usermodels.Username
        print(uname)
        if UserDefaults.standard.string(forKey: "username") != nil{
            let mvc = storyboard?.instantiateViewController(withIdentifier: "TransactionsViewController") as? TransactionsViewController
            self.navigationController?.pushViewController(mvc!, animated: true)
            self.present(mvc!, animated: true)
        }
        title = "Welcome to M_Transaction"
        Designing()
    }
    
    @IBAction func gorgetTapped(_ sender: Any) {
        self.forgetpasswordpage.isHidden = false
        self.loginpage.isHidden = true
        self.otppage.isHidden = true
        self.createpasswordPage.isHidden = true
    }
   
    @IBAction func createTapped(_ sender: Any) {
        do{
            let reachability = try? Reachability.init()
        } catch{
            print("fail to start notifier")
        }
        if ((reachability?.connection) != nil){
            let parameters =  createNewPin()
            guard let url = URL(string: APIURL.API.ResetPin) else{
                return
            }
            var request = URLRequest(url: url)
            do{
                request.httpMethod = "Post"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
                URLSession.shared.dataTask(with:request){ (data,response,error) in
                    if let error = error{
                        print("check this error->\(error.localizedDescription)")
                    }else{
                        do{
                            let jsondata = try? JSONDecoder().decode(resetPin.self, from: data!)
                            let status = jsondata?.status
                            let message = jsondata?.message
                            let dataJson = jsondata?.data
                            print(jsondata)
                            if status == 1{
                                DispatchQueue.main.async {
                                    let alert = UIAlertController(title: "Congradulation!!", message: "You have successful changed your pin", preferredStyle: .alert)
                                    let close = UIAlertAction(title: "Close",  style:UIAlertAction.Style.cancel,handler: { [self] action in
                                       //
                                        DispatchQueue.main.async { [self] in
                                            self.createpasswordPage.isHidden = true
                                            self.loginpage.isHidden = false
                                            phonelbl.text = phoneNumber
                                           
                                            //loginphone.text = phoneNumber
                                            phoneNumber = forgetPhonenumber.text
                                            loginphone.text = forgetPhonenumber.text
                                            loginphone.isEnabled = false
                                            loginphone.textColor = .darkGray
                                            print("this is phone number \(forgetPhonenumber.text)")
                                            self.otppage.isHidden = true
                                            loginpassword.becomeFirstResponder()
                                        }
                                    })
                                    alert.addAction(close)
                                    self.present(alert, animated: true)
                                }
                            }else{
                                
                            }
                        }
                    }
                    
                }.resume()
            }
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text!.count < 1) && (string.count > 0){
            if textField == txt1{
                
                text2.becomeFirstResponder()
            }
            if textField == text2{
                text3.becomeFirstResponder()
            }
            if textField == text3{
                text4.becomeFirstResponder()
            }
            if textField == text4{
                text4.resignFirstResponder()
                self.loginpage.isHidden = true
                self.createpasswordPage.isHidden = false
                
            }
            textField.text = string
            return false
        }else if ((textField.text!.count) >= 0) && (string.count == 0){
            if textField == text2{
               
                //verifybtn .isEnabled = true
                txt1.becomeFirstResponder()
            }
            if textField == text3{
                text2.becomeFirstResponder()
            }
            if textField == text4{
                text3.becomeFirstResponder()
            }
            if textField == txt1{
                txt1.resignFirstResponder()
            }
            textField.text = ""
            return false
        }else if((textField.text!.count) >= 1){
            textField.text = string
            return false
        }
        return true
    }
    @IBAction func forgetTapped(_ sender: Any) {
        
        
        do{
            let reachability = try? Reachability.init()
        } catch{
            print("fail to start notifier")
        }
        if ((reachability?.connection) != nil){
            let parameters = Validation()
            guard let url = URL(string: APIURL.API.checkPhone) else{
                return
            }
            var request = URLRequest(url: url)
            //var token
            do{
                request.httpMethod = "Post"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
                //request.setValue("Bearer " + token, forHTTPHeaderField: "Authorization") // Set the Authorization header with the token
                    
                URLSession.shared.dataTask(with:request){ (data,response,error) in
                    if let error = error{
                        print("check this error->\(error.localizedDescription)")
                    }else{
                        do{
                            var jsondata = try? JSONDecoder().decode(checkPhone.self, from: data!)
                            var status = jsondata?.status
                            
                            print(jsondata)
                            if status == 1{
                                DispatchQueue.main.async { [self] in
                                    self.forgetpasswordpage.isHidden = true
                                    self.loginpage.isHidden = true
                                    self.otppage.isHidden = false
                                    self.createpasswordPage.isHidden = true
                                    phonelbl.text = forgetPhonenumber.text
                                    phoneNumberReceived = forgetPhonenumber.text
                                    
                                }
                            }else{
                                
                            }
                        }
                    }
                    
                }.resume()
            }
        }
    }
    
    
    @IBAction func otpResend(_ sender: Any) {
    }
    
    @IBAction func resetpassword(_ sender: Any) {
        
        
        
    }
    override func willChangeValue(forKey key: String) {
        super.willChangeValue(forKey: key)
        NetworkCheck()
    }
    
    func NetworkCheck(){
        let networkAvailable = NWPathMonitor()
        networkAvailable.pathUpdateHandler = { path in
            if path.status == .satisfied{
                print("no network")
            }else{
                print("connected")
            }
        }
        let que = DispatchQueue(label: "Network")
        networkAvailable.start(queue: que)
    }
    
    
    @IBOutlet weak var createPassword: UIView!
    
    @IBAction func loginTaaped(_ sender: Any) {
        do{
            let reachability = try? Reachability.init()
        } catch{
            print("fail to start notifier")
        }
        if ((reachability?.connection) != nil){
            let parameters = Validation()
            guard let url = URL(string: APIURL.API.Login) else{
                return
            }
            var request = URLRequest(url: url)
            do{
                request.httpMethod = "Post"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
                URLSession.shared.dataTask(with:request){ (data,response,error) in
                    if let error = error{
                        print("check this error->\(error.localizedDescription)")
                    }else{
                        do{
                            var jsondata = try? JSONDecoder().decode(LoginApiData.self, from: data!)
                            let status = jsondata?.status
                            let message = jsondata?.message
                            let dataApi = jsondata?.data
                            let apiToken = jsondata?.data?.token
                            
                            print(jsondata)
                            if status == "1"{
                                if dataApi != nil{
                                    DispatchQueue.main.async {
                                        DispatchQueue.main.async {
                                            let alert = UIAlertController(title: "Successful", message:message, preferredStyle: .alert)
                                            let close = UIAlertAction(title: "Close",  style:UIAlertAction.Style.cancel,handler: { [self] action in
                                                let UserLoginSession = UserModels()
                                                UserLoginSession.token = apiToken
                                                UserLoginSession.PhoneNumber = dataApi?.userPhoneNumber
                                                UserLoginSession.Username = dataApi?.userName
                                                UserLoginSession.balance =  dataApi?.balance
                                                LoginSessionModel.shared.currentUser = UserLoginSession
                                                let details = LoginSessionModel.shared.currentUser
                                                UserDefaults.standard.set(details?.token, forKey: "token")
                                                UserDefaults.standard.set(details?.balance, forKey: "balance")
                                                UserDefaults.standard.set(details?.Username, forKey: "username")
                                                UserDefaults.standard.set(details?.PhoneNumber, forKey: "phonenumber")
                                                print(details)
                                                self.performSegue(withIdentifier: "homepages", sender: self)
                                            })
                                            alert.addAction(close)
                                            self.present(alert, animated: true)
                                        }
                                        
                                    }
                                }else{
                                    DispatchQueue.main.async {
                                        let alert = UIAlertController(title: "Fail", message:message, preferredStyle: .alert)
                                        let close = UIAlertAction(title: "Close",  style:UIAlertAction.Style.cancel,handler: { [self] action in
                                        })
                                        alert.addAction(close)
                                        self.present(alert, animated: true)
                                    }
                                }
                            }else{
                                
                            }
                        }
                    }
                    
                }.resume()
            }
        }
    }
    func Designing()  {
        
        self.loginview.layer.cornerRadius = 20
        loginview.layer.shadowColor = UIColor.black.cgColor
        loginview.layer.shadowOpacity = 1
        forgetview.layer.cornerRadius = 20
        forgetview.layer.shadowColor = UIColor.black.cgColor
        forgetview.layer.shadowOpacity = 1
        otpView.layer.cornerRadius = 20
        otpView.layer.shadowColor = UIColor.black.cgColor
        otpView.layer.shadowOpacity = 1
        createPassword.layer.cornerRadius = 20
        createPassword.layer.shadowColor = UIColor.black.cgColor
        createPassword.layer.shadowOpacity = 1
        loginphone.addBottomBorderLinewithColor(Color:lineColor, width: 1)
        loginpassword.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.forgetPhonenumber.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        password1.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        password2.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        
        let borderColor = UIColor(red: 74/255, green: 87/255, blue: 130/255, alpha: 1)
        self.txt1.layer.masksToBounds = true
        self.txt1.layer.borderWidth = 1
        self.txt1.layer.borderColor = borderColor.cgColor
        self.txt1.layer.cornerRadius = CGRectGetWidth(txt1.frame)/2
        
        self.text2.layer.masksToBounds = true
        self.text2.layer.borderWidth = 1
        self.text2.layer.borderColor = borderColor.cgColor
        self.text2.layer.cornerRadius = CGRectGetWidth(text2.frame)/2
        
        self.text3.layer.masksToBounds = true
        self.text3.layer.borderWidth = 1
        self.text3.layer.borderColor = borderColor.cgColor
        self.text3.layer.cornerRadius = CGRectGetWidth(text3.frame)/2
        
        self.text4.layer.masksToBounds = true
        self.text4.layer.borderWidth = 1
        self.text4.layer.borderColor = borderColor.cgColor
        self.text4.layer.cornerRadius = CGRectGetWidth(text4.frame)/2
    }
}
extension LoginViewController{
    func Validation() ->[String:Any]{
        var parameters = [String: Any]()
        
        
            //phoneNumber = loginphone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            parameters["mobileNumber"] = loginphone.text
            parameters["pin"] = loginpassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
     
       
        return parameters
    }
    func createNewPin() ->[String:Any]{
        var parameters = [String: Any]()
        parameters["pin"] = password1.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        parameters["phone"] = forgetPhonenumber.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        return parameters
    }
}
