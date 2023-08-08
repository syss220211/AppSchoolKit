//
//  ChartViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/08/04.
//

import UIKit
import SwiftUI
import Charts

class ChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        buildButton()
    }
    
    func buildButton() {
        let button = UIButton()
        
        button.setTitle("Show next page", for: .normal)
        button.backgroundColor = .purple
        button.addTarget(self, action: #selector(goNextPage), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    @objc func goNextPage() {
        // 스유로 만든 뷰 사용하기 위해서
        let swiftUIController = UIHostingController(rootView: ToysShapeView()) // contentView가 Viewcontroller가 되어버림
        navigationController?.pushViewController(swiftUIController, animated: true)
    }
}

// SwiftUI 코드
struct ContentView: View {
    var body: some View {
        Text("Hello World!")
    }
}

// Chart 넣기
struct ToyShape: Identifiable {
    var id: UUID = UUID()
    var color: String
    var type: String
    var count: Int
}

let data: [ToyShape] = [
    ToyShape(color: "Green", type: "Cube", count: 2),
    ToyShape(color: "Green", type: "Sphere", count: 0),
    ToyShape(color: "Green", type: "Pyramid", count: 1),
    ToyShape(color: "Purple", type: "Cube", count: 1),
    ToyShape(color: "Purple", type: "Sphere", count: 1),
    ToyShape(color: "Purple", type: "Pyramid", count: 1),
    ToyShape(color: "Pink", type: "Cube", count: 1),
    ToyShape(color: "Pink", type: "Sphere", count: 2),
    ToyShape(color: "Pink", type: "Pyramid", count: 0),
    ToyShape(color: "Yellow", type: "Cube", count: 1),
    ToyShape(color: "Yellow", type: "Sphere", count: 1),
    ToyShape(color: "Yellow", type: "Pyramid", count: 2)
]


struct ToysShapeView: View {
    var body: some View {
        Chart {
            ForEach(data) { shape in
                BarMark(
                    x: .value("Shape Type", shape.type),
                    y: .value("Type Count", shape.count)
                )
                .foregroundStyle(by: .value("Shape Color", shape.color))
            }
        }
        .chartForegroundStyleScale([
            "Green" : .green,
            "Purple" : .purple,
            "Pink" : .pink,
            "Yellow" : .yellow
        ])
        .padding()
    }
}
