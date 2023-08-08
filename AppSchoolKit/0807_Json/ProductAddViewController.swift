//
//  ProductAddViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import UIKit

class ProductAddViewController: UIViewController {
    
    var cartProducts: [Product]?
    
    private var products = ProductStore()
    weak var delegate: ProductDelegate?
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewConstraints()
        setupTableView()
        // setupData()
        fetchAndDisplayProducts()
    }
    
//    func setupData() {
//        products.fetchProducts()
//    }
    
    func fetchAndDisplayProducts() {
        Task {
            await products.fetchProducts()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self // 화면이동 대리자 설정
        tableView.rowHeight = UITableView.automaticDimension
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
        return products.getProductsList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductsTableViewCell
        print(products.getProductsList()[indexPath.row])
        cell.nameLabel.text = products.getProductsList()[indexPath.row].name
        cell.priceLabel.text = products.getProductsList()[indexPath.row].priceString
        cell.imageUrl = products.getProductsList()[indexPath.row].imageURLString
        return cell
    }
}


extension ProductAddViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cartVC = ProductCartViewController()
        let id = products.getProductsList()[indexPath.row].id
        let name = products.getProductsList()[indexPath.row].name
        let price = products.getProductsList()[indexPath.row].price
        let imageURLString = products.getProductsList()[indexPath.row].imageURLString
        let shopURLString = products.getProductsList()[indexPath.row].shopURLString
        
        let newProducts = Product(id: id, name: name, price: price, imageURLString: imageURLString, shopURLString: shopURLString)
        delegate?.addProduct(newProducts)
//        cartVC.tableView.reloadData()
        dismiss(animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
}
