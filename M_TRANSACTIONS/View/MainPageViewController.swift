//
//  MainPageViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit
//import LZViewPager
@available(iOS 15.0, *)
class MainPageViewController: UIViewController {
    //var isSegueInProgress = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        if UserDefaults.standard.string(forKey: "username") != nil{
            let mvc = storyboard?.instantiateViewController(withIdentifier: "TransactionsViewController") as? TransactionsViewController
            self.navigationController?.pushViewController(mvc!, animated: true)
            self.present(mvc!, animated: true)
        }
    }
    

    @IBAction func loginTaaped(_ sender: Any) {
       
            let registration = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
            navigationController?.pushViewController(registration!, animated: true)
        present(registration!, animated: true)
    }

    @IBAction func registrationtapped(_ sender: Any) {
            let registration = storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController
            navigationController?.pushViewController(registration!, animated: true)
        present(registration!, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registration" {
            //isSegueInProgress = false
            // Add any necessary preparation code for the registration view controller
        }
    }
}
