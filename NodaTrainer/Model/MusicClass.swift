//
//  MusicClass.swift
//  NodaTrainer
//
//  Created by sangeles on 9/2/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import Foundation
class MusicClass {
    var title: String
    var price: String
    var professor: String
    var phone: String
    var description: String
    var comments: String
    var image: String
    
    init(titleText: String, priceText: String, professorText: String, phoneText: String, descriptionText: String, commentsText: String, imageURL: String) {
        title = titleText
        price = priceText
        professor = professorText
        phone = phoneText
        description = descriptionText
        comments = commentsText
        image = imageURL
    }
}
