//
//  UserEndpoint.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 07/04/2023.
//

import Foundation
enum UserEndpoint{
    case transactionList
    case charts
    case addWithdraw(addwithdraw:AddWithdraw)
    case withdrawlist
    case sentList
    case addDeposit(addDeposit:deposited)
    case depositList
    case recieved
    
}
extension UserEndpoint:EndPoints{
    
    
    var path: String {
        switch self{
        case .transactionList:
            return "userTranaction"
        case .charts:
            return ""
        case .addWithdraw:
            return "withdraw"
        case .withdrawlist:
            return "withdrawlist"
        case .sentList:
            return "SentList"
        case .addDeposit(addDeposit: let addDeposit):
            return "addDeposit"
        case .depositList:
            return "depositList"
        case .recieved:
            return "reciedList"
        }
    }
    
    var baseURL: String {
        switch self{
        case.transactionList:
            return "http://localhost:3002/"
        case.charts:
            return "http://localhost:3002/"
        case .addWithdraw:
            return "http://localhost:3002/"
        case .withdrawlist:
            return "http://localhost:3002/"
        case .sentList:
            return "http://localhost:3002/"
        case .addDeposit:
            return "http://localhost:3002/"
        case .depositList:
            return "http://localhost:3002/"
        case .recieved:
            return "http://localhost:3002/"
        }
    }
    
    var url: URL? {
        switch self{
        case .transactionList:
            return URL(string: "\(baseURL)\(path)")
        case .charts:
            return URL(string: "\(baseURL)\(path)")
        case .addWithdraw:
            return URL(string: "\(baseURL)\(path)")
        case .withdrawlist:
            return URL(string: "\(baseURL)\(path)")
        case .sentList:
            return URL(string: "\(baseURL)\(path)")
        case .addDeposit:
            return URL(string: "\(baseURL)\(path)")
        case .depositList:
            return URL(string: "\(baseURL)\(path)")
        case .recieved:
            return URL(string: "\(baseURL)\(path)")
        }
    }
    
    var method: HTTPMethods {
        switch self{
        case.transactionList:
            return .get
        case .charts:
            return .get
        case .addWithdraw:
            return.post
        case .withdrawlist:
            return .get
        case .sentList:
            return .get
        case .addDeposit:
            return .post
        case .depositList:
            return .get
        case .recieved:
            return .get
        }
    }
    
    var body: Encodable? {
        switch self{
        case.transactionList:
            return nil
        case .charts:
            return nil
        
        case .addWithdraw (let addwithdraw):
            return addwithdraw
        case .withdrawlist:
            return nil
        case .sentList:
            return nil
        case .addDeposit(addDeposit: let addDeposit):
            return addDeposit
        case .depositList:
            return nil
        case .recieved:
            return nil
        }
    }
    
    var headers: [String : String]? {
        APIMANAGERS.commonHeaders
    }
    
    
}
