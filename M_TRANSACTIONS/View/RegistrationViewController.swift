//
//  RegistrationViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit
import Reachability
@available(iOS 15.0, *)
class RegistrationViewController: UIViewController {
    //createPassword
    @IBOutlet weak var createPassword: UIView!
    
    @IBOutlet weak var CreateNxtBtn: UIButton!
    @IBOutlet weak var confirmpassword: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var createpasswordView: UIView!
    
    
    //otpPage
    @IBOutlet weak var otpPage: UIView!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    @IBOutlet weak var txt3: UITextField!
    @IBOutlet weak var txt4: UITextField!
    @IBOutlet weak var otpView: UIView!
    @IBOutlet weak var phoneLbl: UILabel!
    //contactPage
    @IBOutlet weak var contactPage: UIView!
    
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var county: UITextField!
    @IBOutlet weak var town: UITextField!
    @IBOutlet weak var Arear: UITextField!
    @IBOutlet weak var CAddress: UITextField!
    @IBOutlet weak var PAddress: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var RegPhoneNumber: UITextField!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var cNext: UIButton!
    
    
    //personalpage
    var isTableVisible = false
    var originalText: String?
    @IBOutlet weak var personalpage: UIView!
    
    @IBOutlet weak var tblDropdown: UITableView!
    @IBOutlet weak var fiestname: UITextField!
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var genderSelection: UIButton!
    @IBOutlet weak var occupation: UITextField!
    @IBOutlet weak var dob: UIDatePicker!
    @IBOutlet weak var nationalId: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var middlename: UITextField!
    @IBOutlet weak var tabledropDownHc: NSLayoutConstraint!
    @IBOutlet weak var pnext: UIButton!
    @IBOutlet weak var personaldetails: UIView!
    var reachability = try! Reachability()
    var PhoneNumber:String?
    //pinc
    //var lineColor = UIColor(red: 0.9098, green: 0.1961, blue: 0.9608, alpha: 1.0)
    //green
    var lineColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    
    var OtpString:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        Desingning()
        tabledropDownHc.constant = 0
        self.contactPage.isHidden = true
        self.otpPage.isHidden = true
        self.createPassword.isHidden = true
        
        txt1.delegate = self
        txt2.delegate = self
        txt3.delegate = self
        txt4.delegate = self
        self.navigationItem.title = ""
        
        
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        networkCheck()
    }
    deinit{
        reachability.stopNotifier()
    }
    func networkCheck(){
        DispatchQueue.main.async {
            
            self.reachability.whenReachable = { reachable in
                if reachable.connection == .wifi{
                    
                    print("connected to the wifi")
                }else{
                        print("connected to the celluler")
                }
                //self.view.window?.rootViewController?.dismiss(animated: true)
            }
            self.reachability.whenUnreachable = { _ in
                print("no wifi connection")
                if let networkVM = self.storyboard?.instantiateViewController(identifier: "NetworkViewController") as? NetworkViewController{
                    self.present(networkVM, animated: true)
                }
                
            }
            do{
                try self.reachability.startNotifier()
            }catch {
                print("fail to start notifiew")
            }
            
        }
    }
    @IBAction func personalext(_ sender: Any) {
        self.contactPage.isHidden = false
        self.personalpage.isHidden = true
        self.otpPage.isHidden = true
        self.createPassword.isHidden = true
    }
    
    @IBAction func contactTapped(_ sender: Any) {
        do{
            self.reachability = try Reachability.init()
            
        }catch{
            print("notifier failed")
        }
        if((reachability.connection) != .unavailable){
            let parameters = otpParamater()
            guard let otpUrl = URL(string: APIURL.API.otpURL) else{return}
            var request = URLRequest(url: otpUrl)
            request.httpMethod = "POST"
            request.setValue("Appliocation/Json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters,options: [])
            URLSession.shared.dataTask(with: request){ data,response,error in
                if let error = error{
                    print("data was not able to be send,please check thi error -> \(error.localizedDescription)")
                    
                }else{
                    do{
                        //decode response from api
                        if let json = try JSONSerialization.jsonObject(with: data!) as? [String:Any], let status = json["status"] as? Int {
                            if status == 0 {
                                DispatchQueue.main.async {
                                    let otpResponse = json["otp"] as? String
                                    self.OtpString = otpResponse
                                  self.contactPage.isHidden = true
                                    self.personalpage.isHidden = true
                                    self.otpPage.isHidden = false
                                    self.createPassword.isHidden = true
                                    
                                }
                                
                            }
                        }
                    
                    } catch{
                        
                    }
                }
            } .resume()
        }else{
            networkalert()
        }
        
    }
    
    @IBAction func otpresend(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let deviceVerification = segue.destination as? LoginViewController{
            //deviceVerification.loginphone.text = PhoneFrom
            
        }
        }
    @IBAction func otpNext(_ sender: Any) {
    networkCheck()
        let text1 = txt1.text!
        let text2 = txt2.text!
        let text3 = txt3.text!
        let text4 = txt3.text!
        let combine = text1  +  text2 +  text3  +  text4
        if combine == OtpString{
            let alart = UIAlertController(title: " Verrified!!", message: "Click oky to create Your password ", preferredStyle: .alert)
            
            let closeBtn = UIAlertAction(title: "Okay", style: UIAlertAction.Style.cancel,handler: {action in
                 self.contactPage.isHidden = true
                 self.personalpage.isHidden = true
                 self.otpPage.isHidden = true
                 self.createPassword.isHidden = false
            })
            alart.addAction(closeBtn)
            self.present(alart, animated: true,completion: nil)
        }else{
            let alart = UIAlertController(title: "Not Verrified!!", message: "Re-enter your OTP ", preferredStyle: .alert)
            
            let closeBtn = UIAlertAction(title: "CLose", style: UIAlertAction.Style.cancel,handler: {action in
                self.txt1.text = ""
                self.txt2.text = ""
                self.txt3.text = ""
                self.txt4.text = ""
            })
            alart.addAction(closeBtn)
            self.present(alart, animated: true,completion: nil)
        }
       
    }
    
    @IBAction func textChanged(_ sender: Any) {
        textCOnfigurations()
    }
    
    @IBAction func createbuttonTapped(_ sender: Any) {
      let parameters = createParameters()
        print(parameters)
        
        do{
            self.reachability = try Reachability.init()
        }catch{
            print ("fail to start notifier")
        }
        if((reachability.connection) != .unavailable){
            guard let url = URL(string: APIURL.API.registrationUrl) else{
                print("check this error")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Application/Json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONSerialization.data(withJSONObject:parameters,options: [] )
            URLSession.shared.dataTask(with: request){ data,response,error in
                if let error = error{
                    print("data was not able to be send to the server,check this error \(error.localizedDescription)")
                }else{
                    do{
                        //decode response from api
                        let json = try? JSONDecoder().decode(registrationApi.self, from: data!)
                        var status = json?.status
                        let message = json?.message
                        let dataApi = json?.data
                        if status == "1"{
                            if data != nil {
                                DispatchQueue.main.async {
                                    self.PhoneNumber = json?.data?.phoneNumber
                                    print(self.PhoneNumber)
                                    var PhoneFrom = self.PhoneNumber
                                    let alert = UIAlertController(title: "Successfull", message: "You have Successfull create account with M_TRANSACTION", preferredStyle: .actionSheet)
                                    let continues = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default,handler: { action in
                                        self.performSegue(withIdentifier: "registrationLogin", sender: self)
                                    })
                                    let Close = UIAlertAction(title: "Close", style: UIAlertAction.Style.default,handler: { action in
                                        self.dismiss(animated: true)
                                    })
                                    alert.addAction(continues)
                                    alert.addAction(Close)
                                    self.present(alert, animated: true)
                                }
                            }
                        }
                    
                    } catch{
                        
                    }
                }
            } .resume()
            
        }else{
            let alert = UIAlertController(title: "Error", message: "Something went wrong. Please check your internet connection and try again", preferredStyle: .alert)
            let retry = UIAlertAction(title: "Retry", style: UIAlertAction.Style.default) { [weak self] _ in
                guard let self = self else { return }
                if self.reachability.connection != .unavailable {
                    // do nothing, the alert stays on the screen
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            alert.addAction(retry)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    func networkalert(){
        let alert = UIAlertController(title: "Error!", message: "Check internet connection", preferredStyle: .alert)
        let Close = UIAlertAction(title: "CLose", style: UIAlertAction.Style.cancel,handler: { action in
            
        })
        alert.addAction(Close)
        self.present(alert, animated: true)
        
    }
    func otpParamater() ->[String:Any]{
    var parameters = [String: Any]()
        var phoneNumber:String
        phoneNumber = RegPhoneNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if phoneNumber.hasPrefix("+254") {
            phoneNumber = "254" + String(phoneNumber.dropFirst(4))
        } else if phoneNumber.hasPrefix("254") {
            phoneNumber = "254" + String(phoneNumber.dropFirst(3))
        } else if phoneNumber.hasPrefix("0") {
            phoneNumber = "254" + String(phoneNumber.dropFirst())
        }
        parameters["mobileNumber"] = phoneNumber
        return parameters
        
    }
    func createParameters() ->[String:Any]{
        var parameters = [String: Any]()
        parameters["firstName"] = fiestname.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        parameters["middleName"] = middlename.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        parameters["lastName"] = lastname.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMM-dd"
        let selectedDate = dob.date
        let formattedDate = dateFormatter.string(from: selectedDate)
        parameters["dateOfBirth"] = formattedDate
        parameters["gender"] = genderSelection.currentTitle
        parameters["permanentAddress"] = PAddress.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        parameters["currentAddress"] = CAddress.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        parameters["city"] = Arear.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        parameters["pinCode"] = nationalId.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        parameters["state"] = county.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        parameters["occupation"] = occupation.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        parameters["email"] = email.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        parameters["country"] = country .text?.trimmingCharacters(in: .whitespacesAndNewlines)
        var phoneNumber:String
        phoneNumber = RegPhoneNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if phoneNumber.hasPrefix("+254") {
            phoneNumber = "254" + String(phoneNumber.dropFirst(4))
        } else if phoneNumber.hasPrefix("254") {
            phoneNumber = "254" + String(phoneNumber.dropFirst(3))
        } else if phoneNumber.hasPrefix("0") {
            phoneNumber = "254" + String(phoneNumber.dropFirst())
        }
        parameters["mobileNumber"] = phoneNumber
        parameters["pin"] = password.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        return parameters
    }
    
}
@available(iOS 15.0, *)
extension RegistrationViewController:UITableViewDelegate,UITextFieldDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Select gender")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "gender")
            
        }
        switch indexPath.row {
            case 0:
                cell?.textLabel?.text = "Male"
            case 1:
                cell?.textLabel?.text = "Female"
            case 2:
                cell?.textLabel?.text = "Other"
            default:
                cell?.textLabel?.text = " "
            }
            
            return cell!
    }
    
    func textField(_ textField1: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField1.text!.count < 1) && (string.count > 0){
            if textField1 == txt1{
                txt2.becomeFirstResponder()
            }
            if textField1 == txt2{
                txt3.becomeFirstResponder()
            }
            if textField1 == txt3{
                txt4.becomeFirstResponder()
            }
            if textField1 == txt4{
                txt4.resignFirstResponder()
            }
            textField1.text = string
            return false
        }else if ((textField1.text!.count) >= 0) && (string.count == 0){
            if textField1 == txt2{
                //verifybtn .isEnabled = true
                txt1.becomeFirstResponder()
            }
            if textField1 == txt3{
                txt2.becomeFirstResponder()
            }
            if textField1 == txt4{
                txt3.becomeFirstResponder()
            }
            if textField1 == txt1{
                txt1.resignFirstResponder()
            }
            textField1.text = ""
            return false
        }else if((textField1.text!.count) >= 1){
            textField1.text = string
            return false
        }
        return true
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath),
        let selectedName = cell.textLabel?.text {
           
            genderSelection.setTitle(selectedName, for: .normal)
        }
        switch indexPath.row {
            case 0:
            genderSelection.setTitle("Male", for: .normal)
            
            case 1:
            genderSelection.setTitle("Female", for: .normal)
            case 2:
            genderSelection.setTitle("Other", for: .normal)
            default:
            genderSelection.setTitle(" ", for: .normal)
            }
            UIView.animate(withDuration: 0.5) {
                self.tabledropDownHc.constant = 0
                self.isTableVisible = false
                self.view.layoutIfNeeded()
            }
    }
    @IBAction func genderTapped(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5){
            if self.isTableVisible == false{
                self.isTableVisible = true
                self.tabledropDownHc.constant = 44.0 * 3.0
            }else{
                self.tabledropDownHc.constant = 0
                self.isTableVisible = false
            }
            self.view.layoutIfNeeded()
        }
    }
    
    func Desingning(){
        self.personaldetails.layer.cornerRadius = 20
        self.otpView.layer.cornerRadius = 20
        self.contactView.layer.cornerRadius = 20
        self.createpasswordView.layer.cornerRadius = 20
        self.fiestname.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.middlename.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.lastname.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.nationalId.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.occupation.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        
        self.PAddress.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.RegPhoneNumber.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.email.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.CAddress.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.Arear.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.town.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.county.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.country.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.country.isEnabled = false
        
        
        
        
        self.txt1.addBottomBorderLinewithColor(Color: lineColor, width: 5)
        self.txt2.addBottomBorderLinewithColor(Color: lineColor, width: 5)
        self.txt3.addBottomBorderLinewithColor(Color: lineColor, width: 5)
        self.txt4.addBottomBorderLinewithColor(Color: lineColor, width: 5)
        
        
        self.password.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        self.confirmpassword.addBottomBorderLinewithColor(Color: lineColor, width: 1)
        
        
        
        
        
        
        dob.datePickerMode = .date

        // Set the minimum and maximum selectable dates
        
        let currentDate = Date()
        let maxDate = Calendar.current.date(byAdding: .year, value: -18, to: currentDate)
        let minDate = Calendar.current.date(byAdding: .year, value: -100, to: currentDate)
        dob.maximumDate = maxDate
        dob.minimumDate = minDate
        
        // Set the default date to be displayed in the picker
        dob.date = maxDate!

        // Set up the date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMM-dd"

        // Get the selected date and format it using the date formatter
        let selectedDate = dob.date
        let formattedDate = dateFormatter.string(from: selectedDate)
        print("Selected date: \(formattedDate)")
        textCOnfigurations()
    }
    func textCOnfigurations(){
        if genderSelection.currentTitle != "Plese select gender"{
            self.pnext.isEnabled = true
        }
        if fiestname.text == "" || middlename.text == "" || lastname.text == "" || occupation.text == "" || genderSelection.currentTitle == "Plese select gender"{
            self.pnext.isEnabled = false
        }else if genderSelection.currentTitle != "Plese select gender"{
            self.pnext.isEnabled = true
            
        }else{
            self.pnext.isEnabled = true
        }
        
        if PAddress.text == "" || CAddress.text == "" || email.text == "" || RegPhoneNumber.text  == "" || Arear.text == "" || town.text == "" || county .text == ""{
            self.cNext .isEnabled = false
        }else{
            self.cNext .isEnabled = true
        }
        
    }
    
    
    
}
