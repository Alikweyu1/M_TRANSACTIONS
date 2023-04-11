//
//  UserRegistrationModule.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 05/04/2023.
//

import Foundation
struct UserRegistrationModule{
    let id:Int
    let mobileNumber:String
    
}

struct UserDetails{
    let firstName:String
    let middleName:String
    let lastName:String
    let dateOfBirth:String
    let gender:String
    let permanentAddress:String
    let currentAddress:String
    let areaofResident:String
    let pinCode:String
    let state:String
    let country:String
    let mobileNumber:String
    let email:String
    let balance:balance
}
struct balance{
    let amount:Float
}

struct userTransaction{
    let transactionType:String
    let transactionAmount:Float
    let transactionDate:String
    
}


