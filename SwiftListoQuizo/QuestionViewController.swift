//
//  QuestionViewController.swift
//  SwiftListoQuizo
//
//  Created by Arcaurel on 3/1/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import Foundation
import UIKit


class QuestionViewController: UIViewController {
    
    @IBOutlet weak var themeTitle: UILabel!
    @IBOutlet weak var questionAnswerLabel: UILabel!
    
    var set: QuestionSet = QuestionSet(qTheme: "Dogs")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        themeTitle.text = set.theme
        questionAnswerLabel.text = set.questions[set.questionsIndex].isQuestionSide ? set.questions[set.questionsIndex].question :
            set.questions[set.questionsIndex].answer
    }
    
    @IBAction func moveBackQuestion(_ sender: Any) {
        set.moveBackQuestion()
        updateQuestionAnswerView()
    }
    
    @IBAction func moveForwardQuestion(_ sender: Any) {
        set.moveForwardQuestion()
        updateQuestionAnswerView()
    }
    
    @IBAction func flipQuestionAnswer(_ sender: Any) {
        set.flipQuestionAnswer()
        updateQuestionAnswerView()
    }
    
    func updateQuestionAnswerView() {
        if set.questions[set.questionsIndex].isQuestionSide {
            questionAnswerLabel.text = set.questions[set.questionsIndex].question
        } else {
            questionAnswerLabel.text = set.questions[set.questionsIndex].answer
        }
    }
    
    @IBAction func dismissQuestionView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
