//
//  TransactinViewController.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 04/04/2023.
//

import UIKit

class TransactinViewController: UIViewController {
    private var viewModel = TransactionViewModel()
    @IBOutlet weak var transactiontable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
       
    }

}
extension TransactinViewController {

    func configuration() {
        transactiontable.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        initViewModel()
        observeEvent()
    }

    func initViewModel() {
        viewModel.fetchTransaction()
    }

    // Data binding event observe karega - communication
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }

            switch event {
            case .loading:
                /// Indicator show
                print("Product loading....")
            case .stopLoading:
                // Indicator hide kardo
                print("Stop loading...")
            case .dataLoaded:
                print("Data loaded...")
                DispatchQueue.main.async {
                    // UI Main works well
                    self.transactiontable.reloadData()
                }
            case .error(let error):
                print(error)
            
            }
        }
    }

}




