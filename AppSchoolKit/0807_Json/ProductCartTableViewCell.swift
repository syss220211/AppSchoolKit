//
//  ProductCartTableViewCell.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import UIKit

class ProductCartTableViewCell: UITableViewCell {

    let name: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let price: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
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
//        guard let urlString = self.imageUrl, let url = URL(string: urlString)  else { return }
        let url = URL(string: "url")
        productImage.load(url: url!)
    }
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.addTarget(self, action: #selector(goBuyView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func goBuyView() {
        print("구입하기 버튼 클릭")
    }
    
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
        self.addSubview(productImage)
        self.addSubview(button)
        
        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(price)
    }
    
    func setConstraints() {
        
        // imageView layout
        NSLayoutConstraint.activate([
            productImage.heightAnchor.constraint(equalToConstant: 150),
            productImage.widthAnchor.constraint(equalToConstant: 150),
            productImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            productImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
        
        // button layout
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 20),
            button.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 30)
        ])
        
        // stackView layout
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.productImage.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.productImage.bottomAnchor)
        ])
    }
    
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
