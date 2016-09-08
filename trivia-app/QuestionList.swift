//
//  QuestionList.swift
//  trivia-app
//
//  Created by Eric Dattore on 9/6/16.
//  Copyright © 2016 BuilDev Software. All rights reserved.
//

import Foundation
import UIKit

class QuestionCollection {
    private var easyIndex: Int, mediumIndex:Int , hardIndex: Int
    
    init() {
        easyIndex = 0
        mediumIndex = 0
        hardIndex = 0
    }
    
    func nextQuestion(difficulty: String) -> String {
        print("Next question called for difficulty \(difficulty)")
        return ""
    }
    
    func previousQuestion(difficulty: String) -> String {
        print("Previous question called for difficulty \(difficulty)")
        return ""
    }
}
