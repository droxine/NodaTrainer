//
//  Instrument.swift
//  NodaTrainer
//
//  Created by sangeles on 9/2/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import Foundation

class Instrument {
    var name: String
    var stock: String
    var price: String
    var phone: String
    var discount: String
    var description: String
    var comments: String
    var image: String
    
    init(nameText: String, stockText: String, priceText: String, phoneText: String, discountText: String, descriptionText: String, commentsText: String, imageURL: String) {
        name = nameText
        stock = stockText
        price = priceText
        phone = phoneText
        discount = discountText
        description = descriptionText
        comments = commentsText
        image = imageURL
    }
}
