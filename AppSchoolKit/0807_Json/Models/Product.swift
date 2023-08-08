//
//  Product.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import UIKit

protocol ProductDelegate: AnyObject {
    func addProduct(_ product: Product)
    func removeProduct(index: IndexSet, _ product: Product)
}

struct Product: Identifiable, Codable {
    var id: String
    var name: String
    var price: Double
    var imageURLString: String
    var shopURLString: String
    
    var priceString: String {
        price.currencyString
    }
    
    var imageURL: URL {
        URL(string: imageURLString) ?? URL(string: "https://www.apple.com/kr/")!
    }
    
    var shopURL: URL {
        URL(string: shopURLString) ?? URL(string: "https://www.apple.com/kr/")!
    }
}

extension Double {
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "KRW"
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
