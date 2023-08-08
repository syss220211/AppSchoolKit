//
//  Product.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import UIKit

// 상품 데이터 정의
struct Product: Identifiable, Codable {
//    var id: UUID = UUID()
    var id: String
    var name: String
    var price: Double
    var imageURLString: String
    var shopURLString: String
    
    var priceString: String {
        price.currencyString
//        let formatter: NumberFormatter = NumberFormatter()
//        formatter.numberStyle = .currency
//        formatter.currencyCode = "KRW"
//        return formatter.string(from: NSNumber(value: price)) ?? ""
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
