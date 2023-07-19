//
//  NavigationFirstViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/07/19.
//

import UIKit

class NavigationFirstViewController: UIViewController {

    var count = 0
    // label
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
        button.addTarget(self, action: #selector(plusOne), for: .touchUpInside)
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
    }
    
    func setupView() {
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

    @objc func plusOne() {
        print("+2 버튼이 눌렸습니다")
        count += 1
        
        label.text = "\(count)"
    }

}
