//
//  SendViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 08/04/2023.
//

import UIKit
import MBProgressHUD
class SendViewController: UIViewController {
private var viewModel = UserModel()
    @IBOutlet weak var searchField: UISearchBar!
    @IBOutlet weak var sentListTable: UITableView!
    var filterDataString:[Any]!
    var isSearched = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sentListTable.reloadData()
       config()
        
        self.sentListTable.refreshControl = UIRefreshControl()
        self.sentListTable.refreshControl?.addTarget(self, action: #selector(refreshDate), for: .valueChanged)
    }
    
    func config(){
        sentListTable.register(UINib(nibName: "SentViewCell", bundle: nil), forCellReuseIdentifier: "SentViewCell")
       
        initViewModel()
        observeEvents()
    }
    @objc private func refreshDate(){
        DispatchQueue.main.async {
            self.sentListTable.refreshControl?.endRefreshing()
        }
        self.sentListTable.reloadData()
       
    }
    
    func  initViewModel(){
        DispatchQueue.main.async {
            self.sentListTable.refreshControl?.endRefreshing()
        }
        self.viewModel.fetchSentList()
        
    }
    func observeEvents(listrefresh:Bool = false){
        DispatchQueue.main.async {
            self.sentListTable.refreshControl?.endRefreshing()
        }
        viewModel.eventHandler? = { [weak self] events in
            guard let self else{
                return
            }
            switch events{
                
            case .loading:
                print("List is loading")
                
            case .stopLoading:
                print("Transaction list stopped")
            case .dataLoaded:
                print("Transaction Loaded")
                if listrefresh{
                    DispatchQueue.main.async {
                        self.sentListTable.refreshControl?.endRefreshing()
                    }
                }
                DispatchQueue.main.async {
                    
                    self.sentListTable.reloadData()
                }
            case .error(let error):
                print(error?.localizedDescription)
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
            return viewModel.sentLists.count
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
            let sendLists = viewModel.sentLists[indexPath.row]
            cell.sentLists = sendLists
        }
        return cell
    }
    
    
}
extension SendViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != " "{
            searchBar.placeholder = "Search here"
            let datePattern = "\\b\(searchText)\\b"
            let dateRegex = try? NSRegularExpression(pattern: datePattern, options: .caseInsensitive)

            filterDataString = viewModel.sentLists.filter({
                dateRegex!.firstMatch(in: $0.date, options: [], range: NSRange(location: 0, length: $0.date.utf16.count)) != nil ||  $0.transactionCode.lowercased().contains(searchText.lowercased().uppercased())  || $0.sentType.bank?.accountName?.lowercased().contains(searchText.lowercased()) ?? false || $0.sentType.bank?.accountNumber?.lowercased().contains(searchText.lowercased()) ?? false || $0.sentType.phoneNumber?.phoneNumber.lowercased().contains(searchText.lowercased()) ?? false || $0.sentType.phoneNumber?.Name.lowercased().range(of: searchText, options: .caseInsensitive) != nil
                
            })
        }else{
            self.sentListTable.reloadData()
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
