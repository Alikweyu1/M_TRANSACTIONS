//
//  UserModel.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 07/04/2023.
//

import Foundation
import UIKit
final class UserModel{
    //let listRefresh = UIRefreshControl()
    var TransaRefresh:TransactionsViewController!
    var withdrawList:[withdrawsList] = []
    //var transactions:[Transaction] = []
    var transactions:[welcome2] = []
    var sentLists:[SentList] = []
    var depositList:[deposited] = []
    var recievedList:[Recieve] = []
    var eventHandler: ((_ event: Event) -> Void)?
    func fetchTransactions(){
        self.eventHandler?(.loading)
        APIMANAGERS.shared.request(modalType: [welcome2].self, phoneNumber: "", type: UserEndpoint.transactionList){ [self] response in
            self.eventHandler?(.stopLoading)
            switch response{
            case .success( let transactions):
                self.transactions = transactions
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func transList(){
        let parameter = parameter()
        guard let url = URL(string: APIURL.API.MList2) else{
            return
        }
       var request = URLRequest(url: url)
        do{
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameter)
            URLSession.shared.dataTask(with: request){ data,response,error in
                if let error = error{
                    print(error.localizedDescription)
                }else{
                    let jsonData = try? JSONDecoder().decode(welcome2.self, from: data!)
                    print(jsonData)
                }
            }.resume()
        }
    }
    
    func parameter() ->[String:Any]{
        var parameters = [String: Any]()
        parameters["phone"] = "0716198487"
        return parameters
    }
    func fetchSentList() {
        self.eventHandler?(.loading)
        APIMANAGERS.shared.request(modalType: [SentList].self, phoneNumber: "", type: UserEndpoint.sentList){ [self] response in
            self.eventHandler?(.stopLoading)
            switch response{
            case .success(let sentLists):
                self.sentLists = sentLists
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    
    func addWithdraw(parameters:AddWithdraw) {
        APIMANAGERS.shared.request(modalType: AddWithdraw.self, phoneNumber: "", type: UserEndpoint.addWithdraw(addwithdraw: parameters)){ Result in
            self.eventHandler?(.stopLoading)
            switch Result{
                
            case .success( let addwithdraw):
                self.eventHandler?(.newWithdrawAdded(addwithdraw: addwithdraw))
            case .failure( let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    func fetchwithdrawLists( refresh:Bool = false){
        
        self.eventHandler?(.loading)
        APIMANAGERS.shared.request(modalType: [withdrawsList].self, phoneNumber: "gdgdgd", type: UserEndpoint.withdrawlist){ [self] response in
            self.eventHandler?(.stopLoading)
            
            switch response{
                
            case .success(let withdrawList):
                self.withdrawList = withdrawList
                self.eventHandler?(.dataLoaded)
               
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
        
    }
    
    func fetchDeposit(){
        self.eventHandler?(.loading)
        APIMANAGERS.shared.request(modalType: [deposited].self, phoneNumber: "73tt6t6te", type: UserEndpoint.depositList){ response in
            self.eventHandler?(.stopLoading)
            switch response{
                
            case .success(let depositList):
                self.depositList = depositList
            case .failure( let error):
                self.eventHandler?(.error(error))
            }
            
        }
    }
    func addDeposit(parameters:deposited){
        self.eventHandler?(.loading)
        APIMANAGERS.shared.request(modalType: deposited.self, phoneNumber: "u7tet6re", type: UserEndpoint.addDeposit(addDeposit: parameters)){Result in
            self.eventHandler?(.stopLoading)
            switch Result{
                
            case .success( let addDeposit):
                self.eventHandler?(.newDepopsitAdded(addDeposit: addDeposit))
            case .failure( let error):
                print(error)
            }
        }
    }
    func FetchRevieved(){
        self.eventHandler?(.loading)
        APIMANAGERS.shared.request(modalType: [Recieve].self, phoneNumber: "8585855", type: UserEndpoint.recieved){ response in
            self.eventHandler?(.stopLoading)
            switch response{
                
            case .success(let recievedList):
                self.recievedList = recievedList
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
            
        }
    }
    
}
extension UserModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        case newWithdrawAdded(addwithdraw:AddWithdraw)
        case newDepopsitAdded(addDeposit:deposited)
    }

}
