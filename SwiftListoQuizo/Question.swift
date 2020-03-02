//
//  Question.swift
//  SwiftoListoQuizo
//
//  Created by Arcaurel on 3/1/20.
//  Copyright © 2020 Ramosam. All rights reserved.
//

import SwiftUI
import Foundation
import Combine


class Question {

    let question: String
    let answer: String
    var isQuestionSide = true
    
    init(question: String, answer: String)  {
        self.question = question
        self.answer = answer
    }
    
    func flipQuestionAnswer() {
        isQuestionSide = !isQuestionSide
    }
    
}

