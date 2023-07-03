//
//  NetworkManager.swift
//  Food order
//
//  Created by Максим Зыкин on 30.06.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let apiCategory = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"
    
    func fetchData(completion: @escaping (_ category: [Сategory]) -> Void) {
        guard let url = URL(string: apiCategory) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let category = try decoder.decode(Group.self, from: data)
                //let menu = category
                DispatchQueue.main.async {
                    completion(category.сategories)
                    //print(category)
                }
            } catch let error {
                print("Error--", error)
            }
        }.resume()
    }
}
