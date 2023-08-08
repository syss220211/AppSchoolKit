//
//  JsonViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import UIKit

class ProductCartViewController: UIViewController {

    let tableView = UITableView()
    var cartProducts = CartStore()
//    var carts = CartStore().getCartsList()
    
    // 네비게이션바에 넣기 위한 버튼
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        
        return button
    }()
    
    @objc func plusButtonTapped() {
        
        let addProductVC = ProductAddViewController()
        addProductVC.delegate = self
        let array = cartProducts.getCartsList()
        addProductVC.cartProducts = array
        let navController = UINavigationController(rootViewController: addProductVC)
        navController.modalPresentationStyle = .formSheet
        self.present(navController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupTableView()
        setupTableViewConstraints()
        view.backgroundColor = .systemBackground
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print(#function)
//        tableView.reloadData()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        tableView.reloadData()
//    }

    // 네비게이션 바 세팅 코드
    func setupNaviBar() {
        title = "Cart"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        // 네비게이션바 오른쪽 상단 버튼 설정
        
        // Create a UILabel with the text "ADD"
        let label = UILabel()
        label.text = "ADD"
        label.textColor = .systemBlue // Customize the text color
        label.font = UIFont.systemFont(ofSize: 15) // Customize the font
        label.isUserInteractionEnabled = true // Enable user interaction
        
        // Create a tap gesture recognizer for the label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(plusButtonTapped))
        label.addGestureRecognizer(tapGesture)
        
        // Create a bar button item with the label as the custom view
        let customButtonItem = UIBarButtonItem(customView: label)
        
        // Add the custom button to the navigation bar
        self.navigationItem.rightBarButtonItem = customButtonItem
        
        
        // self.navigationItem.rightBarButtonItem = self.plusButton
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self // 화면이동 대리자 설정
        tableView.rowHeight = 310
        tableView.register(ProductCartTableViewCell.self, forCellReuseIdentifier: "CartCell")

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


extension ProductCartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.getCartsList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! ProductCartTableViewCell

//        let cellItem = cartProducts.getCartsList()[indexPath.row]
//        cell.name.text = cellItem.name
//        cell.price.text = cellItem.priceString
//        cell.imageUrl = cellItem.imageURLString
//
        cell.cartsProduct = cartProducts.getCartsList()[indexPath.row]
        return cell
    }
    
    
}

extension ProductCartViewController: UITableViewDelegate {
    
}


extension ProductCartViewController: ProductDelegate {
    func addProduct(_ product: Product) {
        cartProducts.addProduct(product: product)
        tableView.reloadData()
    }
    
    func removeProduct(index: IndexSet, _ product: Product) {
        cartProducts.removeProducts(at: index)
        tableView.reloadData()
    }
    
    
    
    
    
}
