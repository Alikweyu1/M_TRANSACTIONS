//
//  MainPageViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit

class MainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginTaaped(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: self.view)
    }

    @IBAction func registrationtapped(_ sender: Any) {
        performSegue(withIdentifier: "registration", sender: self.view)
    }
}
