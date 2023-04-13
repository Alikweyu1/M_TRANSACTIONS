//
//  WithdrawViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit
import MBProgressHUD
class WithdrawViewController: UIViewController {
private var viewModel = UserModel()
    var filterDataString:[Any]!
    var isSearched = false
    @IBOutlet weak var withdrawTable: UITableView!
    @IBOutlet weak var seachTxt: UISearchBar!
    var loading = MBProgressHUD()
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
       
    }
    

    func configuration() {
        withdrawTable.register(UINib(nibName: "withdrawTableViewCell", bundle: nil), forCellReuseIdentifier: "withdrawTableViewCell")
        initViewModel()
         obserEvent()
    }
    func initViewModel(){
        viewModel.fetchwithdrawLists()
    }
    func obserEvent(){
        
        let loader = MBProgressHUD.showAdded(to: self.view, animated: true)
            loader.label.text = "Loading....."
        
        viewModel.eventHandler = { [weak self] Events in
            guard let self else{return}
            
           
            switch Events{
                
            case .loading:
                DispatchQueue.main.async {
                    loader.show(animated: true)
                }
                print("withdraw list loading.....")
                
                
            case .stopLoading:
                DispatchQueue.main.async {
                    loader.hide(animated: true)
                    print("send list lstopped loading.....")
                }
            case .dataLoaded:
                DispatchQueue.main.async {
                    loader.hide(animated: true)
                    self.withdrawTable.reloadData()
                }
            case .error(let error):
                print(error!)
            case .newWithdrawAdded(addwithdraw: let addwithdraw):
                print(addwithdraw)
                
            case .newDepopsitAdded(addDeposit: let addDeposit):
                print(addDeposit)
            }
        }
    }

}
extension WithdrawViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearched == true{
            return filterDataString.count
        }else{
            return viewModel.withdrawList.count
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "withdrawTableViewCell") as? withdrawTableViewCell else{
            return UITableViewCell()
        }
        if isSearched == true{
            let withdrawlist = filterDataString[indexPath.row]
            cell.withdrawlist = withdrawlist as? withdrawsList
        }else{
            let withdrawlist = viewModel.withdrawList[indexPath.row]
            cell.withdrawlist = withdrawlist
        }
        return cell
            
    }
    
    
}
extension WithdrawViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            searchBar.placeholder = "Filter by name"
            
            filterDataString = viewModel.withdrawList.filter({$0.name.lowercased().uppercased().prefix(searchText.count) == searchText.lowercased().uppercased()})
        }else{
            self.withdrawTable.reloadData()
        }
        isSearched = true
        self.withdrawTable.reloadData()
        searchBar.placeholder = "Filter by name"
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.seachTxt.text = ""
        self.isSearched = false
        searchBar.placeholder = "Filter by name"
        self.withdrawTable.reloadData()
    }
}
