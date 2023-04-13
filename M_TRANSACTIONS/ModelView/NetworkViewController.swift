//
//  NetworkViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 05/04/2023.
//

import UIKit
import Reachability
class NetworkViewController: UIViewController {
    var reachability = try! Reachability()
    @IBOutlet weak var gifImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let ImageGIF = UIImage.gifImageWithName("sad")
        self.gifImage.image = ImageGIF
    }
    
    @IBAction func retry(_ sender: Any) {
        do{
            self.reachability = try Reachability.init()
        }catch{
            print("fail to start notifier")
        }
        if((reachability.connection) != .unavailable){
            self.dismiss(animated: true)
        }
    }
    
    

}
