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
    
    @IBAction func questionDifficultyChanged(sender: UISegmentedControl) {
        let difficulty = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)!
        print("Question difficulty changed to \(difficulty)")
    }
    
    @IBAction func previousQuestion(sender: UIButton) {
        print("Previous button pressed")
    }
    
    @IBAction func nextQuestion(sender: UIButton) {
        print("Next button pressed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

