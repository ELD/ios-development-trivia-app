//
//  Question.swift
//  trivia-app
//
//  Created by Eric Dattore on 9/7/16.
//  Copyright © 2016 BuilDev Software. All rights reserved.
//

import Foundation

enum AnswerType {
    case Alphabetic
    case Numeric
}

class Question {
    private var question: String
    private var answer: String
    private var answerType: AnswerType
    private var imagePath: String
    
    init(question: String, answer: String, answerType: AnswerType, imagePath: String) {
        self.question = question
        self.answer = answer
        self.answerType = answerType
        self.imagePath = imagePath
    }
    
    func getQuestion() -> String {
        return self.question
    }
    
    func getAnswer() -> String {
        return self.answer
    }
    
    func getAnswerType() -> AnswerType {
        return self.answerType
    }
    
    func getImagePath() -> String {
        return self.imagePath
    }
}
