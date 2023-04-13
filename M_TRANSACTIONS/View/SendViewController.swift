//
//  SendViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 08/04/2023.
//

import UIKit

class SendViewController: UIViewController {
private var sendViewModel = UserModel()
    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var sentListTable: UITableView!
    var filterDataString:[Any]!
    var isSearched = false
    override func viewDidLoad() {
        super.viewDidLoad()

       config()
    }
    
    func config(){
        sentListTable.register(UINib(nibName: "SentViewCell", bundle: nil), forCellReuseIdentifier: "SentViewCell")
        initViewModel()
        obseverbleEvent()
    }
    
    func  initViewModel(){
        self.sendViewModel.fetchSentList()
    }
    func obseverbleEvent(){
        sendViewModel.eventHandler? = {[weak self] event in
            guard let self else{return}
    switch event{
                
            case .loading:
                print("sent list loading")
            case .stopLoading:
                print("sent list stop loading")
            case .dataLoaded:
                print("sent list loaded")
                DispatchQueue.main.async {
                    self.sentListTable.reloadData()
                }
            case .error( let error):
                print(error)
            case .newWithdrawAdded(addwithdraw: let addwithdraw):
                print(addwithdraw)
            case .newDepopsitAdded(addDeposit: let addDeposit):
                print(addDeposit)
            }
        }
    }
}
extension SendViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearched == true{
            return filterDataString.count
        }
        else{
            return sendViewModel.sentLists.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "SentViewCell") as? SentViewCell else{
            return UITableViewCell()
        }
        if isSearched == true{
            let sendLists = filterDataString[indexPath.row]
            cell.sentLists = sendLists as? SentList
        }else{
            let sendLists = sendViewModel.sentLists[indexPath.row]
            cell.sentLists = sendLists
        }
        return cell
    }
    
    
}
extension SendViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            filterDataString = sendViewModel.sentLists.filter({$0.date.lowercased().uppercased().prefix(searchText.count) == searchText.lowercased().uppercased()})
        }
        isSearched = true
        self.sentListTable.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchField.text = ""
        isSearched = false
        self.sentListTable.reloadData()
    }
}
