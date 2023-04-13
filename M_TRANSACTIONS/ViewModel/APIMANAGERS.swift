//
//  APIMANAGERS.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 07/04/2023.
//

import Foundation
import UIKit
enum DataErrors: Error {
    case invalidUrl
    case invalidData
    case InvalidResponse
    case error(Error?)
    
}
typealias Handler<T> = (Result<T, DataErrors>) -> Void
final class APIMANAGERS{
    static let shared  = APIMANAGERS()
    private init(){}
    func request<T:Codable>(
        modalType:T.Type,
        type:EndPoints,completion:@escaping Handler<T>
    ){
        guard let url = type.url else{
            completion(.failure(.invalidUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue
        if let parameter = type.body{
            request.httpBody = try? JSONEncoder().encode(parameter)
        }
        request.allHTTPHeaderFields = type.headers
        URLSession.shared.dataTask(with: request){ data,response,error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let products = try JSONDecoder().decode(modalType, from: data)
                
                completion(.success(products))
                
            }catch {
                completion(.failure(.error(error)))
            }
        }.resume()
    }
    
    
    /*func getTransactions(completion:@escaping Handlers){
        guard let url = URL(string: Constant.API.TransactionURL) else {
            completion(.failure(.invalidUrl))
            return
        }
        URLSession.shared.dataTask(with: url){ data,response,error in
            guard let data,error == nil else{
                print(error?.localizedDescription)
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as?HTTPURLResponse, 200 ... 299 ~= response.statusCode else{
                completion(.failure(.InvalidResponse))
                return
            }
            do{
                 let Transaction = try JSONDecoder().decode([Transaction].self,from: data)
                //print(Transaction)
            }catch{
                completion(.failure(.error(error)))
            }
        }.resume()
        print("ended")
    }*/
    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
}
