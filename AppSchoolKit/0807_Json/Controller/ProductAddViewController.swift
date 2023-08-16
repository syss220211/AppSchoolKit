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
        fetchAndDisplayProducts()
        setupNaviBar()
    }
    
    func fetchAndDisplayProducts() {
        Task {
            await products.fetchProducts()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // 네비게이션 바 세팅 코드
    func setupNaviBar() {
        title = "Cart"
    
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    
        
        let closeButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(closeButtonTapped))
        self.navigationItem.rightBarButtonItem = closeButton
        
        // 네비게이션바 오른쪽 상단 버튼 설정
//        let label = UILabel()
//        label.text = "닫기"
//        label.textColor = .systemBlue
//        label.font = UIFont.systemFont(ofSize: 15)
//        label.isUserInteractionEnabled = true
//
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped))
//        label.addGestureRecognizer(tapGesture)
//        let customButtonItem = UIBarButtonItem(customView: label)
//        self.navigationItem.rightBarButtonItem = customButtonItem
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true)
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
        
        cell.productsData = products.getProductsList()[indexPath.row]
        let data = products.getProductsList()[indexPath.row]
//        cell.nameLabel.text = productData.name
//        cell.priceLabel.text = productData.priceString
//        cell.imageUrl = productData.imageURLString
        
        cell.addCartButtonTapped = { [unowned self] in
            let id = data.id
            let name = data.name
            let price = data.price
            let imageURLString = data.imageURLString
            let shopURLString = products.getProductsList()[indexPath.row].shopURLString
            let newProducts = Product(id: id, name: name, price: price, imageURLString: imageURLString, shopURLString: shopURLString)
            delegate?.addProduct(newProducts)
            self.dismiss(animated: true)
        }
        
        return cell
    }
}


extension ProductAddViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("사이트로 이동하는 버튼이 눌렸음!!")
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cartVC = ProductCartViewController()
//        let id = products.getProductsList()[indexPath.row].id
//        let name = products.getProductsList()[indexPath.row].name
//        let price = products.getProductsList()[indexPath.row].price
//        let imageURLString = products.getProductsList()[indexPath.row].imageURLString
//        let shopURLString = products.getProductsList()[indexPath.row].shopURLString
//
//        let newProducts = Product(id: id, name: name, price: price, imageURLString: imageURLString, shopURLString: shopURLString)
//        delegate?.addProduct(newProducts)
//        dismiss(animated: true)
//    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
}
