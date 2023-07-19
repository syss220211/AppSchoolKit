//
//  WeatherViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/07/19.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "섭씨 온도를 입력하세요."
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "화씨 온도 변환 값"
        return label
    }()
    
    let convertButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("변환", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(convertTemperature), for: .touchUpInside)
        return button
    }()
    
    let stackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 15
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    func setupView() {
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(convertButton)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            textField.heightAnchor.constraint(equalToConstant: 50),
            
            // textField
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
           
        
        ])
    }
    
    @objc func convertTemperature() {
        guard let celTextField = textField.text, let weather = Double(celTextField) else {
            label.text = "값을 입력하세요"
            return
        }
        
        let calculatorWeather = (weather * 9/5) + 32
        label.text = String(calculatorWeather)
    }
    

}
