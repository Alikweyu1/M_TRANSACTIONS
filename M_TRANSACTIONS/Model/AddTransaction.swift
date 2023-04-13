//
//  AddTransaction.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 06/04/2023.
//

import Foundation
struct deposit: Codable {
    var type: typeofTransaction
}
struct typeofTransaction:Codable{
    
    var transactionType:transactionType
}


