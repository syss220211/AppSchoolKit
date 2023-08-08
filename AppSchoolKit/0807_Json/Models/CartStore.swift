//
//  ProductStore.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import Foundation

class CartStore {
    private var products: [Product] = []
    
    func addProduct(product: Product) {
        products.append(product)
    }
    
    func removeProducts(at offsets: IndexSet) {
        products.remove(atOffsets: offsets)
    }
}
