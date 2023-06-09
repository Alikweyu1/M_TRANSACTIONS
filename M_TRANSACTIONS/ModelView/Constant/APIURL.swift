//
//  APIURL.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 05/04/2023.
//

import Foundation
enum APIURL {
    enum API {
    static let registrationUrl = "http://192.168.137.1:9000/fraud/app/register"
        static let otpURL =  "http://localhost:3001/otp"
        //static let Login = "http://localhost:3002/logins"
        static let Login = "http://192.168.137.1:9000/fraud/app/login"
        static let checkPhone = "http://192.168.137.1:9000/otp/send"
        static let ResetPin = "http://192.168.137.1:9000/otp/forgot/password/reset"
        //static let ResetPin = "http://localhost:3002/newPassword"
       // static let MTransfer = "http://localhost:3002/M-Transfer"
        //static let MTransfer = "http://localhost:3002/M-Transfer"
        //static let MTransfer = "http://192.168.137.1:9000/fraud/app/sendmoney"
    static let MTransfer = "http://192.168.137.28:6000/posts"
        static let Till = "http://192.168.137.1:9000/fraud/app/lipabill"
        static let payBill = "http://localhost:3002/paybill"
        static let Bank = "http://localhost:3002/Bank"
        static let MList = "http://localhost:3002/MList"
        static let MList2 = "http://localhost:3002/MList2"
        //static let MList2 = "http://192.168.137.1:9000/fraud/app/account/statement"
    }
}
