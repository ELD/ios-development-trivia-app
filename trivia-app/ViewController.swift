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
    
    let triviaManager = TriviaManager.init()
    var questionDifficulty = "Easy"
    
    @IBAction func questionDifficultyChanged(sender: UISegmentedControl) {
        questionDifficulty = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)!
        let (question, alreadyAnswered) = triviaManager.getQuestions().currentQuestion(
            Difficulty.fromString(questionDifficulty)!
        )
        
        resetAnswerLabel()
        changeQuestionText(question.getQuestion())
        changeKeyboardType(question.getAnswerType())
        setInputStateAndDisplayAnswer(alreadyAnswered, question: question)
    }
    
    @IBAction func previousQuestion(sender: UIButton) {
        resetAnswerLabel()
        let (question, alreadyAnswered) = triviaManager.getQuestions().previousQuestion(
            Difficulty.fromString(questionDifficulty)!
        )
        
        changeQuestionText(question.getQuestion())
        changeKeyboardType(question.getAnswerType())
        setInputStateAndDisplayAnswer(alreadyAnswered, question: question)
    }
    
    @IBAction func nextQuestion(sender: UIButton) {
        if (!triviaManager.getQuestions().hasMoreQuestions(Difficulty.fromString(questionDifficulty)!)) {
            let alert = UIAlertController(title: "", message: "No more questions of this difficulty exist.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(
                UIAlertAction(
                    title: "Ok",
                    style: UIAlertActionStyle.Default,
                    handler: nil
                )
            )
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        resetAnswerLabel()
        let (question, alreadyAnswered) = triviaManager.getQuestions().nextQuestion(
            Difficulty.fromString(questionDifficulty)!
        )
        
        changeQuestionText(question.getQuestion())
        changeKeyboardType(question.getAnswerType())
        setInputStateAndDisplayAnswer(alreadyAnswered, question: question)
    }
    
    @IBAction func onTapGestureRecognized(sender: UITapGestureRecognizer) {
        answerField.resignFirstResponder()
    }
    
    @IBAction func editingDidEndOnExit(sender: UITextField) {
        sender.resignFirstResponder()
    }

    @IBAction func submitAnswer(sender: UIButton) {
        answerField.resignFirstResponder()
        
        let difficulty = Difficulty.fromString(questionDifficulty)!
        let answer = answerField.text!
        
        let result = triviaManager.checkAnswer(difficulty, answer: answer)
        answerField.enabled = false
        updateAnswerAndScore(result)
    }
    
    private func changeQuestionText(questionText: String) {
        self.questionText.text = questionText
    }
    
    private func changeKeyboardType(answerType: AnswerType) {
        switch answerType {
        case .Alphabetic:
            answerField.keyboardType = UIKeyboardType.Alphabet
        case .Numeric:
            answerField.keyboardType = UIKeyboardType.NumberPad
        }
    }
    
    private func setInputStateAndDisplayAnswer(alreadyAnswered: Bool, question: Question) {
        answerField.text = nil
        answerField.placeholder = "Answer..."
        answerField.enabled = !alreadyAnswered
        
        if alreadyAnswered {
            answerField.placeholder = "You already answered this question"
            answerLabel.text = "You already answered this question.\nAnswer: " + question.getAnswer()
        }
    }
    
    private func updateAnswerAndScore(answerString: String) {
        scoreLabel.text = "Score: " + String(triviaManager.getScore())
        answerLabel.text = answerString
    }
    
    private func resetAnswerLabel() {
        answerLabel.text = ""
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
        
        let (question, alreadyAnswered) = triviaManager.getQuestions().currentQuestion(
            Difficulty.fromString(questionDifficulty)!
        )
        
        changeQuestionText(question.getQuestion())
        changeKeyboardType(question.getAnswerType())
        setInputStateAndDisplayAnswer(alreadyAnswered, question: question)
    }
    
}

