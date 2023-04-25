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
        static let Login = "http://192.168.137.1:9000/fraud/app/login"
        static let checkPhone = "http://localhost:3002/phonereset"
        static let ResetPin = "http://localhost:3002/newPassword"
        static let MTransfer = "http://localhost:3002/M-Transfer"
        static let Till = "http://192.168.137.1:9000/fraud/app/lipabill"
        static let payBill = "http://localhost:3002/paybill"
        static let Bank = "http://localhost:3002/Bank"
    }
}
