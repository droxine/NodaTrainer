//
//  Question.swift
//  NodaTrainer
//
//  Created by sangeles on 5/4/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let answer: Bool
    
    init(text:String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
}
