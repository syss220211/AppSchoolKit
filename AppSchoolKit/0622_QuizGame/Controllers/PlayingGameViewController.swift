//
//  PlayingGameViewController.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/06/22.
//

import UIKit

class PlayingGameViewController: UIViewController {
    
    // 샘플 데이터 설정
    var quizData = SetQuizData()
    
    var score = 0
    var falseScore = 0
    
    
    @IBOutlet weak var correctScore: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var wrongScore: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radiusButton(button: buttonA)
        radiusButton(button: buttonB)
        radiusButton(button: buttonC)
        radiusButton(button: buttonD)
        
//        correctScore.text = "맞은 개수 : \(quizData.getScore())"
//        wrongScore.text = "틀린 개수 : \(quizData.getWrongScore())"
        questionLabel.text = quizData.getQuestion()
        
        buttonA.setTitle(quizData.getChoiceA(), for: .normal)
        buttonB.setTitle(quizData.getChoiceB(), for: .normal)
        buttonC.setTitle(quizData.getChoiceC(), for: .normal)
        buttonD.setTitle(quizData.getChoiceD(), for: .normal)
        
    }
    
    func radiusButton(button: UIButton) {
        button.layer.cornerRadius = 10
        
    }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        if (quizData.getAnswer() == sender.currentTitle!) {
            score += 1
        } else {
            falseScore += 1
        }
        
        quizData.questionUpdate()
        
        correctScore.text = "맞은 개수 : \(score)"
        wrongScore.text = "틀린 개수 : \(falseScore)"
        
        questionLabel.text = quizData.getQuestion()
        buttonA.setTitle(quizData.getChoiceA(), for: .normal)
        buttonB.setTitle(quizData.getChoiceB(), for: .normal)
        buttonC.setTitle(quizData.getChoiceC(), for: .normal)
        buttonD.setTitle(quizData.getChoiceD(), for: .normal)
    }
    
    
    
    
    
}
