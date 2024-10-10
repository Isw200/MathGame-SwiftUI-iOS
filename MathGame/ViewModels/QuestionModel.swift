//
//  QuestionModel.swift
//  MathGame
//
//  Created by Isuru Ariyarathna on 2024-10-09.
//

import Foundation

enum Operators: String, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
}

class QuestionModel: ObservableObject {
    @Published var number1: Int
    @Published var number2: Int
    @Published var operation: String
    @Published var answer: Double = 0.0
    @Published var inputAnswer: String = ""
    @Published var isCorrect: Bool = false
    @Published var showResult: Bool = false
    
    private var operatorArray: [Operators] = Operators.allCases

    init() {
        self.number1 = Int.random(in: 1...10)
        self.number2 = Int.random(in: 1...10)
        self.operation = operatorArray.randomElement()?.rawValue ?? Operators.add.rawValue
        self.answer = getAnswer()
        self.showResult = false
        self.inputAnswer = ""
        self.isCorrect = false
    }
    
    private func getAnswer() -> Double {
        let number1 = Double(self.number1)
        let number2 = Double(self.number2)
        
        switch operation {
        case "+": return number1 + number2
        case "-": return number1 - number2
        case "*": return number1 * number2
        case "/": return number2 != 0 ? number1 / number2 : 0
        default: return 0
        }
    }

    func regenerateQuestion() {
        self.number1 = Int.random(in: 1...10)
        self.number2 = Int.random(in: 1...10)
        self.operation = operatorArray.randomElement()?.rawValue ?? Operators.add.rawValue
        self.answer = getAnswer()
        self.showResult = false
        self.inputAnswer = ""
        self.isCorrect = false
    }
    
    func checkAnswer() {
        let doubeAnswer = Double(inputAnswer)
        isCorrect = answer == doubeAnswer
        showResult = true
    }
}
