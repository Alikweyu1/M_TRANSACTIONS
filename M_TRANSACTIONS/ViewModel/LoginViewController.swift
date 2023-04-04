//
//  LoginViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit

class LoginViewController: UIViewController {
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.forgetpasswordpage.isHidden = true
        self.otppage.isHidden = true
        self.createpasswordPage.isHidden = true
    }
    
    @IBAction func gorgetTapped(_ sender: Any) {
        self.forgetpasswordpage.isHidden = false
        self.loginpage.isHidden = true
        self.otppage.isHidden = true
        self.createpasswordPage.isHidden = true
    }
    
    @IBAction func forgetTapped(_ sender: Any) {
        self.forgetpasswordpage.isHidden = true
        self.loginpage.isHidden = true
        self.otppage.isHidden = false
        self.createpasswordPage.isHidden = true
    }
    
    
    @IBAction func otpResend(_ sender: Any) {
    }
    
    @IBAction func resetpassword(_ sender: Any) {
        self.forgetpasswordpage.isHidden = true
        self.loginpage.isHidden = true
        self.otppage.isHidden = true
        self.createpasswordPage.isHidden = false
    }
    
    
    
    
    @IBOutlet weak var createPassword: UIView!
    
    @IBAction func loginTaaped(_ sender: Any) {
    }
}
