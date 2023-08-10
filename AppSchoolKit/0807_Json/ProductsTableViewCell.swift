//
//  ProductsTableViewCell.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import UIKit

//protocol ProductsTableViewCellDelegate: AnyObject {
//    func goToProductCart()
//}

class ProductsTableViewCell: UITableViewCell {
    
    // button 으로 넘어가기 위한 클로저 사용
    var addCartButtonTapped: (() -> ())?
    
//    var buyButtonTapped: (UITableViewCell) -> Void = { (sender) in }
//    weak var delegate: ProductsTableViewCellDelegate?
    
    // didSet?
    var productsData: Product? {
        didSet {
            configureUIWithData()
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleToFill
        return imageView
    }()

    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }

    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString)  else { return }

        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            guard self.imageUrl == url.absoluteString else { return }

            DispatchQueue.main.async {
                self.productImage.image = UIImage(data: data)
            }
        }
    }

    let buyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("  Add  ", for: .normal)
        button.setTitleColor(UIColor(red: 0.7, green: 0.9, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.lightGray.cgColor // Border color
//        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10) // 여백주는건데 deprecated 예정임
//        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
//
//    @objc func goBuyView() {
//        print("구입하기 버튼 클릭")
//        buyButtonTapped(self)
////        delegate?.goToProductCart()
//    }
    
    let totalStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        sv.backgroundColor = .yellow
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // MARK: - 코드로 cell을 짤 때 사용하는 셀에 대한 셀설정 메소드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.buyButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        setupStackView() // 생성한 스택뷰를 셀로서 불러오기
        
    }
    
    @objc func addButtonTapped() {
        print("버튼이 눌렸음!")
        addCartButtonTapped?()
    }
    
    required init?(coder: NSCoder) { // super의 필수 생성자 구현
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - 오토레이아웃 제약 업데이트
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setupStackView() {
        self.contentView.addSubview(productImage)
        self.contentView.addSubview(buyButton)
        addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(priceLabel)
    }

    func setConstraints() {
        
        // imageView layout
        NSLayoutConstraint.activate([
            productImage.heightAnchor.constraint(equalToConstant: (self.contentView.bounds.width / 5) * 3),
            productImage.widthAnchor.constraint(equalToConstant: (self.contentView.bounds.width / 5) * 4),
            productImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            productImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        ])

        // stackView layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: productImage.leadingAnchor)
        ])
        
        // button layout
        NSLayoutConstraint.activate([
            buyButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            buyButton.trailingAnchor.constraint(equalTo: productImage.trailingAnchor)
        ])
    }
    
    func configureUIWithData() {
        nameLabel.text = productsData?.name
        priceLabel.text = productsData?.priceString
        
        imageUrl = productsData?.imageURLString
    }

}
