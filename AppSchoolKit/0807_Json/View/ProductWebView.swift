//
//  ProductWebView.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/11.
//

import UIKit
import WebKit

class ProductWebView: UIView {
    
    // webview 그리기...
    let productSite: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView() {
        addSubview(productSite)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            productSite.topAnchor.constraint(equalTo: topAnchor),
            productSite.leadingAnchor.constraint(equalTo: leadingAnchor),
            productSite.bottomAnchor.constraint(equalTo: bottomAnchor),
            productSite.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
