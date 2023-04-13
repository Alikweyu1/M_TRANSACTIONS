//
//  TransactionModel.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 07/04/2023.
//


final class TransactionViewModel {
    
    var transactions: [Transaction] = []
    var eventHandler: ((_ event: Event) -> Void)? // Data Binding Closure
    
    func fetchTransaction() {
        self.eventHandler?(.loading)
        APIMANAGERS.shared.getTransactions{ response in
                self.eventHandler?(.stopLoading)
            
                switch response {
                   
                case .success(let transactions):
                    
                    self.transactions = transactions
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    print("cooo")
                    self.eventHandler?(.error(error))
                }
            }
    }
}
extension TransactionViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        //case newProductAdded(product: AddProduct)
    }

}
