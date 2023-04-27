//
//  Transaction.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 07/04/2023.
//

import Foundation
import UIKit

struct Transaction: Codable {
    let amount:Float
    let date:String
    var  types:types
    var name:String
}
struct types:Codable{
    var types:String? = nil
    var send:Send? = nil
    var recieved:Recieved? = nil
    var deposit:Deposit? = nil
    var withdraw:Withdraw? = nil
}
struct Send:Codable{
    let phoneNumber:String
}
struct Recieved:Codable{
    let phoneNumber:String
}
struct Deposit:Codable{
    let AgentNumber:String
    let StoreNumber:String
}

struct Withdraw:Codable{
    let AgentNumber:String
    let StoreNumber:String
    let name:String
}
struct userIDs:Codable{
    var id:Int? = nil
    let phoneNumber:String
    
}
struct AddWithdraw:Codable {
    
    let amount:String
    let pin:String
}
struct SentList:Codable{
    let amount:Float
    
    let transactionCode:String
    let date:String
    
    var sentType:sentType
}
struct sentType:Codable{
    var phoneNumber:sentPhone? = nil
    var bank:sentBank?  = nil
}
struct sentPhone:Codable{
    var phoneNumber:String
    var Name:String
}
struct sentBank:Codable{
    var accountName:String? = nil
    var accountNumber:String? = nil
}

struct deposited:Codable{
    let amount:Float
    let date:String
    let ref:String
    let depositedType:depositType
}
struct depositType:Codable{
    
    var phoneNumber:String?  = nil
    var bank:BankInfo? = nil
}
struct phone:Codable{
    var phoneNumber:String
    var Name:String
}
struct Recieve:Codable{
    let amount:Float
    let date:String
    let recieved:RecievedType
}
struct RecievedType:Codable{
    var phoneNumber:String?  = nil
    var bank:BankInfo? = nil
    
    
}
struct BankInfo:Codable{
    var accountName:String? = nil
    var accountNumber:String? = nil
}
struct Menu:Codable{
    let Income:String
    let Expenses:String
    let Sent:String
    let Withdraw:String
    let Deposited:String
    let Recieved:String
}
struct OnbordingSLide{
    let title:String
    let description:String
    let images:UIImage
}
struct LoginApiData:Codable{
    let status :String
    let message:String
   
    
    var data:DataLoginapiWitToken? = nil
}
struct DataLoginapiWitToken:Codable{
     let token:String
    let userPhoneNumber:String
    let userName:String
    
    let balance:Float
    
}
struct DataLogin:Codable{
    let firstName:String

    let middleName:String

    let lastName:String

    let dateOfBirth:String

    let gender:String

    let pin:String

    let occupation:String

    let permanentAddress:String

    let currentAddress:String

    let mobileNumber:String

    let email:String

    let pinCode:String

    let city:String

    let state:String

    let country:String
}
struct checkPhone:Codable{
    let status:Int
}
struct otp:Codable{
    let status:Int
}
struct resetPin:Codable{
    let status:Int
    let message:String
   var data:NewPasswordResponse? = nil
}
struct NewPasswordResponse:Codable{
    let username:String
    let email:String
    let phoneNumber:String
}
struct menuTransfer:Codable{
    let MTransfer:String
    let Lipa:String
    let PayBill:String
    let Bank:String
}
struct MtransferApi:Codable{
    let status:String
    let message:String
    var data:MtransferData? = nil
}
struct MtransferData:Codable{
    let amount:Double
    let RecievedBy:String
}

struct registrationApi:Codable{
    let status:String
    let message:String
    var data:RegistratioData? = nil
}
struct RegistratioData:Codable{
    let phoneNumber:String
}

