//
//  GuessView.swift
//  MathGame
//
//  Created by Isuru Ariyarathna on 2024-10-09.
//

import SwiftUI

struct GuessView: View {
    @StateObject var question: QuestionModel = QuestionModel()
    @StateObject var settingsViewModel = SettingsViewModel()
    @State var mark: Int = 0
    @Binding var marks: Int
    @AppStorage("selectedColor") var selectedColor: String = "Red"
    @AppStorage("fontSize") var fontSize: Double = 1
    
    func generateRandomMathProblem() -> QuestionModel {
        .init()
    }
    
    var body: some View {
        VStack {
            Text("Guess the answer")
                .font(.system(size: 30, weight: .bold))
                .padding(.top)
                .foregroundStyle(settingsViewModel.getColor(for: selectedColor))
            
            Text("What is \(question.number1) \(question.operation) \(question.number2) ?")
                .font(.system(size: 40 * fontSize, weight: .bold))
                .padding()
            
            if question.showResult {
                if question.isCorrect {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("Correct!")
                            .font(.system(size: 30 * fontSize, weight: .bold))
                    }
                    .foregroundStyle(.green)
                    
                    .onAppear {marks += 1}
                } else {
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("Incorrect!")
                            .font(.system(size: 30 * fontSize, weight: .bold))
                    }
                    .foregroundStyle(.red)

                    .onAppear {marks -= 1}
                }
            }
            
            HStack{
                TextField("Your Answer", text: $question.inputAnswer)
                    .font(.system(size: 20 * fontSize, weight: .bold))
                    .padding()
                    .foregroundStyle(settingsViewModel.getColor(for: selectedColor))
                Button {
                    question.checkAnswer()
                } label: {
                    Text("Submit")
                        .foregroundStyle(settingsViewModel.getColor(for: selectedColor))
                }
                .padding()
                .disabled(question.showResult)
            }
            .border(settingsViewModel.getColor(for: selectedColor), width: 1)
            .padding()
            
            Text("\(marks)")
                .font(.system(size: 120 * fontSize, weight: .bold))
            
            Text("Instructions")
                .padding(.bottom)
                .font(.system(size:  18 * fontSize))
            Text("Submith the correct answer to gain 1 point. Submit the wrong answer or press the next question to lose 1 point.")
                .multilineTextAlignment(.center)
                .padding(.bottom)
                .font(.system(size:  18 * fontSize))
            
            Button {
                question.regenerateQuestion()
            } label: {
                Text("Next Question")
                    .font(.system(size:  18 * fontSize))
            }
            .foregroundColor(.white)
            .frame(width: 200, height: 50)
            .background(settingsViewModel.getColor(for: selectedColor))
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    GuessView(marks: .constant(0))
}
