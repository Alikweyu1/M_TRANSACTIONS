//
//  RecievedController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 10/04/2023.
//

import UIKit

class RecievedController: UIViewController {
    @IBOutlet weak var RecievedTable:UITableView!
    @IBOutlet weak var searchField: UISearchBar!
    var filterDataString:[Any]!
    var isSearched = false
    private var viewModel = UserModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        RecievedConfig()
    }
    

    
}
extension RecievedController{
    func  RecievedConfig(){
        self.RecievedTable.register(UINib(nibName: "RecievedListViewCell", bundle: nil), forCellReuseIdentifier: "RecievedListViewCell")
        initViewModel()
        obseveEvent()
    }
    func initViewModel(){
        self.viewModel.FetchRevieved()
    }
    func obseveEvent(){
        viewModel.eventHandler = { [weak self] Event in
            guard let self else{return}
            switch Event{
                
            case .loading:
                print("loading.....")
            case .stopLoading:
                print("Stopped loading")
            case .dataLoaded:
                print("data loaded")
                DispatchQueue.main.async {
                    self.RecievedTable.reloadData()
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
extension RecievedController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearched == true{
            return filterDataString.count
        }else{
            return viewModel.recievedList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecievedListViewCell") as? RecievedListViewCell else{
            return UITableViewCell()
        }
        if isSearched == true{
            let recievedList = filterDataString[indexPath.row]
            cell.recievedList = recievedList as? Recieve
        }else{
            let recievedList = viewModel.recievedList[indexPath.row]
            cell.recievedList = recievedList
        }
        return cell
    }
    
    
}
extension RecievedController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            filterDataString = viewModel.recievedList.filter({$0.date.lowercased().uppercased().prefix(searchText.count) == searchText.lowercased().uppercased()})
        }else{
            self.RecievedTable.reloadData()
        }
        self.isSearched = true
        
        self.RecievedTable.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchField.text = ""
        self.isSearched = false
        self.RecievedTable.reloadData()
    }
    
}
