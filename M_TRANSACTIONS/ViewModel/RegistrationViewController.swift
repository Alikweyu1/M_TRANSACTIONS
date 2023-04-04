//
//  RegistrationViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit

class RegistrationViewController: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabledropDownHc.constant = 0
        self.contactPage.isHidden = true
        
    }
    
    @IBAction func personalext(_ sender: Any) {
        self.contactPage.isHidden = false
        self.personalpage.isHidden = true
    }
    
   
    
    
}
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath),
        let selectedName = cell.textLabel?.text {
            print("You have selected: \(selectedName)")
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
        print("tapped")
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
}
