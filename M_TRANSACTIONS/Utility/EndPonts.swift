//
//  EndPonts.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 07/04/2023.
//

import Foundation
enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}
protocol EndPoints {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
    var body: Encodable? { get }
    var headers: [String: String]? { get }
    
    func endpointURL(phoneNumber: String) -> URL?
}
