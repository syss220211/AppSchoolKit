//
//  ProductStore.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import Foundation

class CartStore {
    var carts: [Product] = []
    
    func addProduct(product: Product) {
        carts.append(product)
    }
    
    func removeProducts(index: IndexPath) {
        carts.remove(at: index.row)
    }
    
    func getCartsList() -> [Product] {
        return carts
    }
}
