//
//  ProductCartTableViewCell.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import UIKit

class ProductCartTableViewCell: UITableViewCell {
    
    // 버튼 액션 클로저
    var reportButtonAction: (() -> ())?
    
    
    var cartsProduct: Product? {
        didSet {
            guard let carts = cartsProduct else { return }
            name.text = carts.name
            price.text = carts.priceString
            imageUrl = carts.imageURLString
        }
    }
    
    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let price: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
    
    let websiteButton: UIButton = {
        let button = UIButton()
        button.setTitle("  Buy  ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
//        button.addTarget(self, action: #selector(goWebsitView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    // MARK: - 코드로 cell을 짤 때 사용하는 셀에 대한 셀설정 메소드
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView() // 생성한 스택뷰를 셀로서 불러오기
        
        // 셀에 버튼 넣어주기
        self.websiteButton.addTarget(self, action: #selector(reportButtonTapped), for: .touchUpInside)
    }
    
    @objc func reportButtonTapped() {
        print("구입하기 버튼 Tapped!!")
        reportButtonAction?()
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
        self.contentView.addSubview(websiteButton)
        addSubview(stackView)
        
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(price)
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
            websiteButton.topAnchor.constraint(equalTo: stackView.topAnchor),
            websiteButton.trailingAnchor.constraint(equalTo: productImage.trailingAnchor)
        ])
    }
    
}
