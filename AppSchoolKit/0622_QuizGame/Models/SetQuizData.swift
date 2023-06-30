//
//  SetQuizData.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/06/22.
//

import Foundation
import UIKit

struct SetQuizData {
    var score = 0
    var wrongScore = 0
    var questionNumber = 0
    
    let quizData: [QuizModel] = [
        QuizModel(question: "사과를 영어로 하면?", answerA: "apple", answerB: "orange", answerC: "lemon", answerD: "melon", answer: "apple"),
        QuizModel(question: "방탄소년단의 멤버가 아닌 사람은?", answerA: "정국", answerB: "RM", answerC: "지민", answerD: "백현", answer: "백현"),
        QuizModel(question: "다음 앨범을 부른 가수의 멤버가 아닌것은?", answerA: "김채원", answerB: "조유리", answerC: "홍은채", answerD: "사쿠라", answer: "조유리"),
        QuizModel(question: "미국의 도시가 아닌것은?", answerA: "시카고", answerB: "피닉스", answerC: "슬라우", answerD: "휴스턴", answer: "슬라우"),
        QuizModel(question: "소녀시대 멤버의 인원은?", answerA: "8명", answerB: "7명", answerC: "9명", answerD: "6명", answer: "8명"),
        QuizModel(question: "다음 앨범을 부른 가수는?", answerA: "뉴진스", answerB: "엔믹스", answerC: "프로미스나인", answerD: "에스파", answer: "에스파")
    ]
    
    
    func getQuestion() -> String {
        return quizData[questionNumber].question
    }
    
    func getChoiceA() -> String {
        quizData[questionNumber].answerA
    }
    
    func getChoiceB() -> String {
        quizData[questionNumber].answerB
    }
    
    func getChoiceC() -> String {
        quizData[questionNumber].answerC
    }
    
    func getChoiceD() -> String {
        quizData[questionNumber].answerD
    }
    
    func getAnswer() -> String {
        quizData[questionNumber].answer
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getWrongScore() -> Int {
        return wrongScore
    }
    
    mutating func questionUpdate() {
        if (questionNumber < quizData.count - 1) {
            questionNumber += 1
        } else {
            // 종료 뷰 넣어주기
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(input: String) -> String {
        return quizData[questionNumber].answer
//        if(input == getAnswer()) {
//            score += 1
//            return score
//        } else {
//            wrongScore += 1
//            return wrongScore
//        }
    }
}

