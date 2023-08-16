//
//  ProductWebViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/11.
//

import UIKit

class ProductWebViewController: UIViewController {

    let webView = ProductWebView()
    
    override func loadView() {
        self.view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
