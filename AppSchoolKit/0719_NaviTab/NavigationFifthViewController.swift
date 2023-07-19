//
//  NavigationFifthViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/07/19.
//

import UIKit

class NavigationFifthViewController: UIViewController {

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("페이지 이동 버튼", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupView()
    }

    
    func setupView() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            //button
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
            
            
        ])
    }
    
    @objc func tappedNextButton() {
        let fifthDetailViewController = FifthDetailViewController()
        navigationController?.pushViewController(fifthDetailViewController, animated: true)
    }
}
