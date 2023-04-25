//
//  Class.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 25/04/2023.
//

import Foundation
class UserModels{
    var Username:String?
    var PhoneNumber:String?
    var token:String?
    var balance:Double?
}
class LoginSessionModel {
    static let shared = LoginSessionModel()
    private init() {}
    
    var currentUser:UserModels?
}


