//
//  ViewController.swift
//  trivia-app
//
//  Created by Eric Dattore on 8/31/16.
//  Copyright © 2016 BuilDev Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionDifficultySegmentedControl: UISegmentedControl!
    @IBOutlet weak var previousQuestionButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var answerField: UITextField!
    
    let qList: QuestionCollection = QuestionCollection.init()
    var questionDifficulty = "Easy"
    
    @IBAction func questionDifficultyChanged(sender: UISegmentedControl) {
        questionDifficulty = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)!
        print("Question difficulty changed to \(questionDifficulty)")
    }
    
    @IBAction func previousQuestion(sender: UIButton) {
        changeQuestionText(qList.previousQuestion(questionDifficulty))
    }
    
    @IBAction func nextQuestion(sender: UIButton) {
        changeQuestionText(qList.nextQuestion(questionDifficulty))
    }
    
    @IBAction func onTapGestureRecognized(sender: UITapGestureRecognizer) {
        answerField.resignFirstResponder()
    }
    
    @IBAction func editingDidEndOnExit(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    private func changeQuestionText(questionText: String) {
        self.questionText.text = questionText
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let title = "About Trivia"
        let message = "The following trivia game features three difficulty of questions." +
            "\nEasy questions are worth 1 point." +
            "\nMedium questions are worth 2 points." +
        "\nHard questions are worth 3 points."
        
        let alert = UIAlertController.init(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.Alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: "Ok",
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}

