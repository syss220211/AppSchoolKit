//
//  JsonViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import UIKit

class ProductCartViewController: UIViewController {

    private let addProductVC = ProductAddViewController()
    private let cartView = ProductCartTableViewCell()
    private let websiteView =  ProductWebViewController()
    
    let tableView = UITableView()
    var cartProducts = CartStore()
//    var carts = CartStore().getCartsList()
    
    // 네비게이션바에 넣기 위한 버튼
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        
        return button
    }()
    
    @objc func plusButtonTapped() {
        addProductVC.delegate = self
        
        let array = cartProducts.getCartsList()
        addProductVC.cartProducts = array
        
        let navController = UINavigationController(rootViewController: addProductVC)
        navController.modalPresentationStyle = .formSheet
        addProductVC.title = "상품 목록"
        self.present(navController, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupTableView()
        setupTableViewConstraints()
        view.backgroundColor = .systemBackground
        setupBuyButton()
    }
    
    // Buy 버튼 테스트 1
    func setupBuyButton() {
        cartView.websiteButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
    }
    
    @objc func buyButtonTapped() {
        print("구매 버튼이 눌렸음!!")
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
        
        // 네비게이션 타이틀 크게 만들기
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // 네비게이션바 오른쪽 상단 버튼 설정
        let label = UILabel()
        label.text = "ADD"
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 15)
        label.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(plusButtonTapped))
        label.addGestureRecognizer(tapGesture)
        let customButtonItem = UIBarButtonItem(customView: label)
        self.navigationItem.rightBarButtonItem = customButtonItem
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self // 화면이동 대리자 설정
        tableView.rowHeight = 310
        // 셀 등록
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
        cell.cartsProduct = cartProducts.getCartsList()[indexPath.row]
        cell.reportButtonAction = { [unowned self] in
            print("사이트로 이동하는 버튼이 눌렸음!!")
            let testURL = cartProducts.getCartsList()[indexPath.row].shopURLString
            
            if let url = URL(string: testURL) {
                let request = URLRequest(url: url)
                websiteView.webView.productSite.load(request)
            }
            
            let navController = UINavigationController(rootViewController: websiteView)
            navController.modalPresentationStyle = .formSheet
            websiteView.title = "\(cartProducts.getCartsList()[indexPath.row].name)"

            let closeButton = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(closeButtonTapped))
            websiteView.navigationItem.rightBarButtonItem = closeButton
            
            self.present(navController, animated: true)
        }
        return cell
    }
    
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension ProductCartViewController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    ////        navigationController?.pushViewController(websiteView, animated: true)
    //    }
    //
    //    @objc func closeButtonTapped() {
    //        self.dismiss(animated: true, completion: nil)
    //    }
    
    // swipeAction 추가하기??
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, completionHandler) in
            guard let self = self else { return }
            // Perform the delete action here
            self.cartProducts.removeProducts(index: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
            
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}


extension ProductCartViewController: ProductDelegate {
    func removeProduct(index: IndexPath) {
        cartProducts.removeProducts(index: index)
        tableView.reloadData()
    }
    
    func addProduct(_ product: Product) {
        cartProducts.addProduct(product: product)
        tableView.reloadData()
    }

}
