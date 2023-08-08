//
//  MapKitViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/03.
//

import UIKit
import WebKit

class MapKitViewController: UIViewController {
    
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSetup()
        webViewSetup()
//        uikitSetup()
    }
    
    func labelSetup() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        let label: UILabel = UILabel()
        label.text = "Hello, World"
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)
        ])
    }
    
    func webViewSetup() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        let webView: WKWebView = WKWebView()
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            webView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            webView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            webView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            webView.heightAnchor.constraint(equalTo: safeArea.heightAnchor)
        ])
        
        if let url = URL(string: "https://www.youtube.com/") {
            webView.load(URLRequest(url: url))
        }
        
    }
    
    func uikitSetup() {
        let label: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 50)
            label.text = "0"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // button
        let plusButton: UIButton = {
            let button = UIButton()
            button.setTitle("+1", for: .normal)
            button.backgroundColor = .cyan
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 7
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let stackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.alignment = .fill
            sv.distribution = .fill
            sv.translatesAutoresizingMaskIntoConstraints = false
            return sv
        }()
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(plusButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            //stackview layout
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 150),
            stackView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
}
