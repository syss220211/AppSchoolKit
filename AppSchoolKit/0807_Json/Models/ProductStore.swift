//
//  ProductStore.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import Foundation

class ProductStore {
    private var products: [Product] = []
    
    func getProductsList() -> [Product] {
        return products
    }
    
    
    func fetchProducts() {
        products = loadJson(filename: "products.geojson")
    }
    
    // json 으로부터 데이터 읽어오기
    func loadJson(filename: String) -> [Product] {
        let data: Data
        guard let file: URL = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("\(filename) not found.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError()
        }
        
        do {
            return try JSONDecoder().decode([Product].self, from: data)
        } catch {
            fatalError("Unable to parse \(filename): \(error)")
        }
    }
    

}
