//
//  ProductAddViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import UIKit

class ProductAddViewController: UIViewController {

    private var products = ProductStore()
    
    var productsArray: [Product] = []
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewConstraints()
        setupTableView()
        setupData()
        tableView.reloadData()
    }
    
    func setupData() {
        products.fetchProducts()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self // 화면이동 대리자 설정
        tableView.rowHeight = 220 //UITableView.automaticDimension
        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: "ProductCell")
    }
    
    // 테이블 뷰 오토레이아웃 설정
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    
}

extension ProductAddViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.getProductsList().count // products.loadJson(filename: "products").count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductsTableViewCell
        cell.nameLabel.text = products.getProductsList()[indexPath.row].name
        cell.priceLabel.text = products.getProductsList()[indexPath.row].priceString
        cell.imageUrl = products.getProductsList()[indexPath.row].imageURLString
        return cell
    }
}


extension ProductAddViewController: UITableViewDelegate {
//    // 높이 조절
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.rowHeight
//    }
}
