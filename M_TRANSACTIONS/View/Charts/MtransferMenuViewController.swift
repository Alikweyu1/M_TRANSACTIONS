//
//  MtransferMenuViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 23/04/2023.
//

import UIKit

class MtransferMenuViewController: UITabBarController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mtransferMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "MtransferTableViewCell", for: indexPath) as? MtransferTableViewCell
        let transfermenu = mtransferMenu[indexPath.row]
        cell?.menuTransfer.text = transfermenu
        return cell!
    }
    
    @IBOutlet weak var TableCell:UITableView!
    let mtransferMenu = ["M-transfer","Till","Bank"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TableCell.delegate = self
        TableCell.dataSource = self
        //TableCell.register(UINib(nibName: "MenuViewCell", bundle: nil), forCellReuseIdentifier: "MenuViewCell")
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
