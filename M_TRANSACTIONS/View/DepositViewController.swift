//
//  DepositViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit

class DepositViewController: UIViewController {
    var filterDataString:[Any]!
    var isSearched = false
    @IBOutlet weak var depositTable: UITableView!
    @IBOutlet weak var seachTxt: UISearchBar!

    private var DepositViewModel = UserModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        depositConfig()
    }
    

    
  

}
extension DepositViewController{
    func depositConfig(){
        depositTable.register(UINib(nibName: "DepositTableViewCell", bundle: nil), forCellReuseIdentifier: "DepositTableViewCell")
        initDepostViewModel()
        ObservableEvent()
    }
    func  initDepostViewModel(){
        self.DepositViewModel.fetchDeposit()
    }
    func  ObservableEvent(){
        DepositViewModel.eventHandler = { [weak self] Events in
            switch Events{
                
            case .loading:
             print("Loading .....")
            case .stopLoading:
                print("stopped loading")
            case .dataLoaded:
                print("deposit list Loaded")
                DispatchQueue.main.async {
                    self?.depositTable.reloadData()
                }
            case .error( let error):
                print(error!)
            case .newWithdrawAdded(addwithdraw: let addwithdraw):
                print(addwithdraw)
            case .newDepopsitAdded(addDeposit: let addDeposit):
                print(addDeposit)
            }
        }
    }
}
extension DepositViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearched == true{
            return filterDataString.count
        }else{
            return DepositViewModel.depositList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "DepositTableViewCell")  as? DepositTableViewCell else {
            return UITableViewCell()
            
        }
        if isSearched == true{
            let depositLists = filterDataString[indexPath.row]
            cell.depositLists = depositLists as? deposited
        }else{
            let depositLists = DepositViewModel.depositList[indexPath.row]
            cell.depositLists = depositLists
        }
        return cell
    }
    
}
extension DepositViewController:UISearchBarDelegate{
  
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            filterDataString = DepositViewModel.depositList.filter({$0.date.lowercased().uppercased().prefix(searchText.count) == searchText.lowercased().uppercased()})
        }
        isSearched = true
        self.depositTable.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.isSearched = false
        seachTxt.text = ""
        self.depositTable.reloadData()
    }
    
}
