//
//  ProductsTableViewCell.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/07.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

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
        imageView.contentMode = .scaleAspectFit
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

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .red
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
        sv.spacing = 10
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
//        self.addSubview(button)
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(priceLabel)
    }
    
    func setConstraints() {
        
        // imageView layout
        NSLayoutConstraint.activate([
            
            productImage.heightAnchor.constraint(equalToConstant: 150),
            productImage.widthAnchor.constraint(equalToConstant: 200),
            productImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            productImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
//            productImage.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
//            productImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),

        ])
        
        // button layout
//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
//            button.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
//        ])
//
        // stackView layout
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 5),
//            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10)
        ])
    }

}
