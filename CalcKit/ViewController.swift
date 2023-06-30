//
//  ViewController.swift
//  CalcKit
//
//  Created by Chloe Chung on 2023/06/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    var oprFunc: (Int, Int) -> Int = { (n1: Int, n2: Int) -> Int in
        return n1 + n2
    }
    
    var firstNumber: String = ""
    var opeartion: String = ""
    var secondNumber: String = ""
    
    var haveResult: Bool = false
    var resultNumber: String = ""
    var numAfterResult: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func numberButton(_ sender: UIButton) {
        if opeartion == "" {
            firstNumber += (sender.titleLabel?.text)!
            label.text = firstNumber
        } else if opeartion != "" {
            secondNumber += (sender.titleLabel?.text)!
            label.text =  secondNumber
        }
    }
    
    @IBAction func divideButtonTapped(_ sender: UIButton) {
        opeartion = "/"
        
        oprFunc = { (n1: Int, n2: Int) -> Int in
            return n1 / n2
        }
    }
    
    @IBAction func multButtonTapped(_ sender: UIButton) {
        opeartion = "*"
        
        oprFunc = { (n1: Int, n2: Int) -> Int in
            return n1 * n2
        }
        
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        opeartion = "-"
        oprFunc = { (n1: Int, n2: Int) -> Int in
            return n1 - n2
        }
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        opeartion = "+"
        
        oprFunc = { (n1: Int, n2: Int) -> Int in
            return n1 + n2
        }
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        print("firstNumber : \(firstNumber)")
        print("secondNumber: \(secondNumber)")
        
        let result: Int = oprFunc(Int(firstNumber)!, Int(secondNumber)!)
        firstNumber = resultNumber
        
        print("firstNumber : \(firstNumber)")
        print("resultNumber : \(resultNumber)")
        
        firstNumber = "\(result)"
        secondNumber = ""
        resultNumber = ""
        opeartion = ""
        label.text = "\(result)"
        
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        firstNumber = ""
        secondNumber = ""
        opeartion = ""
        label.text = ""
    }
    

}

