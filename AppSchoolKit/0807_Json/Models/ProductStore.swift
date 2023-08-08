//
//  ProductStore.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import Foundation

class ProductStore {
    private var products: [Product] = []
    
    func fetchProducts() async {
//        products = loadJson(filename: "products.geojson")
        
        // async await 사용하기
        let urlString: String = "https://run.mocky.io/v3/77dd252c-3a7e-4595-b08b-29f04e9477d6"
        
        guard let url = URL(string: urlString) else {
            print("Wrong URL")
            return
        }
        
        do {
            let (data, response) = try await
            URLSession.shared.data(from: url)
//            print("\(data)")

            let jsonString = String(data: data, encoding: .utf8)
//            print("\(jsonString ?? "")")
            
            products = try JSONDecoder().decode([Product].self, from: data)
        } catch {
            debugPrint("Error loading \(url)")
            debugPrint(error.localizedDescription)
        }
        
    }
    
    func getProductsList() -> [Product] {
        return products
    }
    
    // json 으로부터 데이터 읽어오기
//    func loadJson(filename: String) -> [Product] {
//        let data: Data
//        guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else {
//            fatalError("\(filename) not found.")
//        }
//
//        do {
//            data = try Data(contentsOf: file)
//        } catch {
//            fatalError()
//        }
//
//        do {
//            return try JSONDecoder().decode([Product].self, from: data)
//        } catch {
//            fatalError("Unable to parse \(filename): \(error)")
//        }
//    }
    

}
