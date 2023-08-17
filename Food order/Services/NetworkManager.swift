//
//  NetworkManager.swift
//  Food order
//
//  Created by Максим Зыкин on 30.06.2023.
//

import Foundation

final class NetworkManager<T: Codable> {
    
    static func fetchData(urlJSON: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: urlJSON) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let category = try decoder.decode(T.self, from: data)
                DispatchQueue.global(qos: .userInitiated).async {
                    completion(.success(category))
                    print(category)
                }
            } catch let error {
                print("Error--", error)
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case decodingError(err: String)
    case error(err: String)
}
//
//class NetworkManager {
//    static let shared = NetworkManager()
//
//    private let apiCategory = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"
//    private let apiDishes = "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b"
//
//    func fetchData(completion: @escaping (_ category: [Сategory]) -> Void) {
//        guard let url = URL(string: apiCategory) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "Error")
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let category = try decoder.decode(Group.self, from: data)
//                //let menu = category
//                DispatchQueue.main.async {
//                    completion(category.сategories)
//                    //print(category)
//                }
//            } catch let error {
//                print("Error--", error)
//            }
//        }.resume()
//    }
//
//    func fetchDataDish(completion: @escaping (_ dishes: [Dishes]) -> Void) {
//        guard let url = URL(string: apiDishes) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "Error")
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let category = try decoder.decode(GroupDish.self, from: data)
//                DispatchQueue.main.async {
//                    completion(category.dishes)
//                }
//            } catch let error {
//                print("Error---d", error)
//            }
//        }.resume()
//    }
//}
