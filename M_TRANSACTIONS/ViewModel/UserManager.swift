//
//  UserManager.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 06/04/2023.
//
import Foundation
enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}
typealias Handler<T> = (Result<T, DataError>) -> Void

final class UserManager {

    static let shared = UserManager()
    private init() {}

    func request<T: Codable>(
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Handler<T>
    ) {
        guard let url = type.url else {
            completion(.failure(.invalidURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = type.method.rawValue

        if let parameters = type.body {
            request.httpBody = try? JSONEncoder().encode(parameters)
        }

        request.allHTTPHeaderFields = type.headers

        // Background task
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode(modelType, from: data)
                completion(.success(products))
            }catch {
                completion(.failure(.network(error)))
            }

        }.resume()
    }


    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }



    /*
    func fetchProducts(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.productURL) else {
            completion(.failure(.invalidURL)) // I forgot to mention this in the video
            return
        }
        // Background task
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            // JSONDecoder() - Data ka Model(Array) mai convert karega
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            }catch {
                completion(.failure(.network(error)))
            }

        }.resume()
        print("Ended")
    }
    */
}

/*
class A: UserManager {

    override func temp() {
        <#code#>
    }

    func configuration() {
        let manager = UserManager()
        manager.temp()

        // UserManager.temp()
        UserManager.shared.temp()
    }

}
*/

// singleton - singleton class ka object create hoga outside of the class
// Singleton - singleton class ka object create nahi hoga outside of the class
