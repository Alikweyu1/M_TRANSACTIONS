//
//  MenuViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 09/04/2023.
//

import UIKit

class MenuViewController: UIViewController {
    //var menu_vc : TransactionsViewController!
    @IBOutlet weak var MenuTable: UITableView!
    @IBOutlet weak var name:UILabel!
    @IBOutlet weak var Close: UIButton!
    @IBOutlet weak var Logount: UIButton!
    var title_array = ["Income","Expenses","Sent","Withdraw","Deposited","Recieved"]
    var menuHome : TransactionsViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
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
            print("2")
        case 3:
            print("3")
        case 4:
            print("4")
        case 5:
            print("5")
            
        default:
            break
        }
    }
}

