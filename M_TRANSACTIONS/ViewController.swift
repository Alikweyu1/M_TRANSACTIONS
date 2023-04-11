//
//  ViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title =  " "
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func skipped(_ sender: Any) {
        performSegue(withIdentifier: "skip", sender: self)
    }
   
}

