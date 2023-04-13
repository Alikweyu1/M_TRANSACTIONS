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
struct addTransaction:Codable{
    var id:Int? = nil
    var type:type
}
struct userTransaction:Codable{
    var transactionType:transactionType
   
}

struct transactionType:Codable{
    var type:type
    var transactioncode:String
}

struct type:Codable {
    var type:String
    var amount:Float
    let date:String
    var receivedby:account
}
struct account:Codable{
    var phoneNumber:String? = nil
    var tillNo:String? = nil
    var paybill:paybillAcc? = nil
}
struct  paybillAcc:Codable{
    var paybillNo:String? = nil
    var account:String? = nil
}



