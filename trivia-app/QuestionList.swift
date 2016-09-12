//
//  QuestionList.swift
//  trivia-app
//
//  Created by Eric Dattore on 9/6/16.
//  Copyright © 2016 BuilDev Software. All rights reserved.
//

import Foundation
import UIKit

enum Difficulty {
    case Easy
    case Medium
    case Hard
    
    static func fromString(raw: String) -> Difficulty? {
        if raw == "Easy" {
            return .Easy
        } else if raw == "Medium" {
            return .Medium
        } else if raw == "Hard" {
            return .Hard
        }
        
        return nil
    }
}

class QuestionCollection {
    private var easyIndex: Int, mediumIndex:Int , hardIndex: Int
    private var easyQs: [(Question, Bool)],
        mediumQs: [(Question, Bool)],
        hardQs: [(Question, Bool)]
    
    init() {
        easyIndex = 0
        mediumIndex = 0
        hardIndex = 0
        
        easyQs = [
            (Question.init(
                question: "How many members are in the House of Representatives?",
                answer: "435",
                answerType: .Numeric,
                imagePath: "house"
            ), false),
            (Question.init(
                question: "How many members are in the Senate?",
                answer: "100",
                answerType: .Numeric,
                imagePath: "senate"
            ), false),
            (Question.init(
                question: "Who's the Governor of Colorado?",
                answer: "John Hickenlooper",
                answerType: .Alphabetic,
                imagePath: "john_hickenlooper"
            ), false)
        ]
        
        mediumQs = [
            (Question.init(
                question: "What is the term length (in years) for a member of the House of Representatives?",
                answer: "2",
                answerType: .Numeric,
                imagePath: "house"
            ), false),
            (Question.init(
                question: "What's the age requirement to serve as the President",
                answer: "35",
                answerType: .Numeric,
                imagePath: "president"
            ), false),
            (Question.init(
                question: "Who is the Chief Justice of the United States?",
                answer: "John Roberts",
                answerType: .Alphabetic,
                imagePath: "john_roberts"
            ), false),
        ]
        
        hardQs = [
            (Question.init(
                question: "What is the upper house of the United States Congress?",
                answer: "Senate",
                answerType: .Alphabetic,
                imagePath: "capitol"
            ), false),
            (Question.init(
                question: "Who is fourth in line of presidential succession?",
                answer: "Secretary of State",
                answerType: .Alphabetic,
                imagePath: "white_house"
            ), false),
            (Question.init(
                question: "What Federal Department is NOAA under?",
                answer: "Department of Commerce",
                answerType: .Alphabetic,
                imagePath: "noaa"
            ), false),
            (Question.init(
                question: "How many votes does a Cloture motion require?",
                answer: "60",
                answerType: .Numeric,
                imagePath: "senate"
            ), false),
        ]
    }
    
    func hasMoreQuestions(difficulty: Difficulty) -> Bool {
        var result = true
        switch difficulty {
        case .Easy:
            result = easyIndex < (easyQs.count - 1)
        case .Medium:
            result = mediumIndex < (mediumQs.count - 1)
        case .Hard:
            result = hardIndex < (hardQs.count - 1)
        }
        
        return result
    }
    
    func currentQuestion(difficulty: Difficulty) -> (Question, Bool) {
        switch difficulty {
        case .Easy:
            return easyQs[easyIndex]
        case .Medium:
            return mediumQs[mediumIndex]
        case .Hard:
            return hardQs[hardIndex]
        }
    }
    
    func nextQuestion(difficulty: Difficulty) -> (Question, Bool) {
        switch difficulty {
        case .Easy:
            if easyIndex < (easyQs.count - 1) {
                easyIndex += 1
            }
            
            return easyQs[easyIndex]
        case .Medium:
            if mediumIndex < (mediumQs.count - 1) {
                mediumIndex += 1
            }
            
            return mediumQs[mediumIndex]
        case .Hard:
            if hardIndex < (hardQs.count - 1) {
                hardIndex += 1
            }
            
            return hardQs[hardIndex]
        }
    }
    
    func previousQuestion(difficulty: Difficulty) -> (Question, Bool) {
        switch difficulty {
        case .Easy:
            if easyIndex > 0 {
                easyIndex -= 1
            }
            
            return easyQs[easyIndex]
        case .Medium:
            if mediumIndex > 0 {
                mediumIndex -= 1
            }
            
            return mediumQs[mediumIndex]
        case .Hard:
            if hardIndex > 0 {
                hardIndex -= 1
            }
            
            return hardQs[hardIndex]
        }
    }
    
    func updateQuestion(difficulty: Difficulty, newQ: (Question, Bool)) {
        switch difficulty {
        case .Easy:
            easyQs[easyIndex] = newQ
        case .Medium:
            mediumQs[mediumIndex] = newQ
        case .Hard:
            hardQs[hardIndex] = newQ
        }
    }
}
