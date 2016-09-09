//
//  Question.swift
//  trivia-app
//
//  Created by Eric Dattore on 9/7/16.
//  Copyright © 2016 BuilDev Software. All rights reserved.
//

import Foundation
import UIKit

enum AnswerType {
    case Alphabetic
    case Numeric
}

class Question {
    private var question: String
    private var answer: String
    private var answerType: AnswerType
    
    init(question: String, answer: String, answerType: AnswerType) {
        self.question = question
        self.answer = answer
        self.answerType = answerType
    }
    
    func getQuestion() -> String {
        return self.question
    }
    
    func getAnswer() -> String {
        return self.answer
    }
    
    func checkAnswer(userAnswer: String) -> Bool {
        // TODO
        return false
    }
    
    func getAnswerType() -> AnswerType {
        return self.answerType
    }
}
