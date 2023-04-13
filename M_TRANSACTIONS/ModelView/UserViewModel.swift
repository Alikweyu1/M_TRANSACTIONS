//
//  UserViewModel.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 06/04/2023.
//

final class UserViewModel {

    var products: [Product] = []
    var eventHandler: ((_ event: Event) -> Void)? // Data Binding Closure

    func fetchProducts() {
        self.eventHandler?(.loading)
        UserManager.shared.request(
            modelType: [Product].self,
            type: UserEndpoint.getTransaction) { response in
                self.eventHandler?(.stopLoading)
                switch response {
                case .success(let products):
                    self.products = products
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    self.eventHandler?(.error(error))
                }
            }
    }

    func addTransaction(parameters:deposit){
        UserManager.shared.request(modelType: deposit.self, type: UserEndpoint.addtransaction(addtransaction: parameters)){ result in
            switch result{
                
            case .success(let userTransaction):
                self.eventHandler?(.newProductAdded(product: userTransaction))
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }




    /*
    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    */

}

extension UserViewModel {

    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
        case newProductAdded(product: AddProduct)
    }

}
