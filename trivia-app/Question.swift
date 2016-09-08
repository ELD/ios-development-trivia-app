//
//  Question.swift
//  trivia-app
//
//  Created by Eric Dattore on 9/7/16.
//  Copyright © 2016 BuilDev Software. All rights reserved.
//

import Foundation
import UIKit

class Question {
    private var question = ""
    private var answer = ""
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
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
}
