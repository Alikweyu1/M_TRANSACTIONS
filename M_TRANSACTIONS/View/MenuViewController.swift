//
//  MenuViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 09/04/2023.
//

import UIKit

class MenuViewController: UIViewController {
    //var menu_vc : TransactionsViewController!
    var username = UserDefaults.standard.string(forKey: "username")
    var balances = UserDefaults.standard.string(forKey: "balance")
    @IBOutlet weak var MenuTable: UITableView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var balance:UILabel!
    @IBOutlet weak var Close: UIButton!
    @IBOutlet weak var Logount: UIButton!
    @IBOutlet weak var UserName:UILabel!
    var title_array = ["Income","Expenses","Sent","Withdraw","Deposited","Recieved"]
    var menuHome : TransactionsViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.UserName.text = " Welcome \(username!) to M_TRANSACTION"
        self.balance.text = "You balance is ksh\(balances!)"
        configs()
    }
    

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        print("tapped")
    }
    
    
}
extension MenuViewController{
    func configs(){
        MenuTable.register(UINib(nibName: "MenuViewCell", bundle: nil), forCellReuseIdentifier: "MenuViewCell")
    }
    
    
}
extension MenuViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuViewCell") as?MenuViewCell else{
            return UITableViewCell()
            
        }
        let title_array = title_array[indexPath.row]
        cell.menutitels.text = title_array
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
           print("0")
           
                
        case 1:
            print("1")
        case 2:
            if let mainPage = storyboard?.instantiateViewController(withIdentifier: "SendViewController") as? SendViewController{
                navigationController?.pushViewController(mainPage, animated: true)
                if let homeVC = self.presentingViewController as? TransactionsViewController {
                                homeVC.closeMenu()
                            }
            }
        case 3:
            if let mainPage = storyboard?.instantiateViewController(withIdentifier: "WithdrawViewController") as? WithdrawViewController{
                navigationController?.pushViewController(mainPage, animated: true)
                if let homeVC = self.presentingViewController as? TransactionsViewController {
                                homeVC.closeMenu()
                            }
            }
        case 4:
            if let mainPage = storyboard?.instantiateViewController(withIdentifier: "DepositViewController") as? DepositViewController{
                navigationController?.pushViewController(mainPage, animated: true)
                if let homeVC = self.presentingViewController as? TransactionsViewController {
                                homeVC.closeMenu()
                            }
            }
        case 5:
            print("5")
            if let mainPage = storyboard?.instantiateViewController(withIdentifier: "RecievedController") as?RecievedController{
                navigationController?.pushViewController(mainPage, animated: true)
                if let homeVC = self.presentingViewController as? TransactionsViewController {
                                homeVC.closeMenu()
                            }
            }
        default:
            break
        }
    }
}

