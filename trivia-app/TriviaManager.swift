//
//  TriviaManager.swift
//  trivia-app
//
//  Created by Eric Dattore on 9/8/16.
//  Copyright © 2016 BuilDev Software. All rights reserved.
//

import Foundation
import UIKit

class TriviaManager {
    private var correctEasy: Int, correctMedium: Int, correctHard: Int
    private let questions = QuestionCollection.init()
    
    init() {
        correctEasy = 0
        correctMedium = 0
        correctHard = 0
    }
    
    func getScore() -> Int {
        return correctEasy + 2 * correctMedium + 3 * correctHard
    }
    
    func getQuestions() -> QuestionCollection {
        return self.questions
    }
    
    func checkAnswer(difficulty: Difficulty, answer: String) -> String {
        let (question, _) = questions.currentQuestion(difficulty)
        let actualAnswer = question.getAnswer().lowercaseString
        var response = ""
        
        switch question.getAnswerType() {
        case .Alphabetic:
            response = checkAlphabeticAnswer(question.getAnswer(), actual: actualAnswer, difficulty: difficulty)
        case .Numeric:
            response = checkNumericAnswer(question.getAnswer(), actual: actualAnswer, difficulty: difficulty)
        }
        
        answerQuestion(difficulty, newQ: (question, true))
        return response
    }
    
    func answerQuestion(difficulty: Difficulty, newQ: (Question, Bool)) {
        questions.updateQuestion(difficulty, newQ: newQ)
    }
    
    private func checkAlphabeticAnswer(expected: String, actual: String, difficulty: Difficulty) -> String {
        var response = "That's not right... The actual answer was: " + expected
        
        if expected.lowercaseString.containsString(actual.lowercaseString) &&
            actual.characters.count >= expected.characters.count {
            incrementScore(difficulty)
            response = "That's correct (or close)! The actual answer was: " + expected
        }
        
        return response
    }
    
    private func checkNumericAnswer(expected: String, actual: String, difficulty: Difficulty) -> String {
        var response = "That's not right... The actual answer was: " + expected
        
        let numericExpected = Float64(expected)!
        let numericActual = Float64(actual)!
        
        if numericActual > numericExpected - numericExpected * 0.05 &&
            numericActual < numericExpected + numericExpected * 0.05 {
            incrementScore(difficulty)
            response = "That's correct (or close)! The actual answer was: " + expected
        }
        
        return response
    }
    
    private func incrementScore(difficulty: Difficulty) {
        switch difficulty {
        case .Easy:
            correctEasy += 1
        case .Medium:
            correctMedium += 1
        case .Hard:
            correctHard += 1
        }
    }
}
