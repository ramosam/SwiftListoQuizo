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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var questionAnswerLabel: UILabel!
    @IBOutlet weak var background: UIView!
    private let CURRENT_INDEX = "currentIndex"
    private let IS_QUESTION_SIDE = "isQuestionSide"
    private let colorChoices = [UIColor.white, UIColor.gray, UIColor.systemPink, UIColor.purple]
    var set: QuestionSet = QuestionSet(qTheme: "Dogs")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if !UserDefaults.standard.bool(forKey: "questionDefaults") {

            UserDefaults.standard.set(0, forKey: CURRENT_INDEX)
            
            UserDefaults.standard.set(true, forKey: "questionDefaults")
            
        }
        background.backgroundColor = colorChoices[UserDefaults.standard.integer(forKey: "color")]
        themeTitle.text = set.theme
        questionAnswerLabel.text = set.questions[set.questionsIndex].isQuestionSide ? set.questions[set.questionsIndex].question :
            set.questions[set.questionsIndex].answer
        let namePlaceholder = UserDefaults.standard.string(forKey: "name")
        nameLabel.text = namePlaceholder == "" ? "" : namePlaceholder
    }
    
    @IBAction func moveBackQuestion(_ sender: Any) {
        set.moveBackQuestion()
        updateQuestionAnswerView()
        UserDefaults.standard.set(set.questionsIndex, forKey: CURRENT_INDEX)
    }
    
    @IBAction func moveForwardQuestion(_ sender: Any) {
        set.moveForwardQuestion()
        updateQuestionAnswerView()
        UserDefaults.standard.set(set.questionsIndex, forKey: CURRENT_INDEX)
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
