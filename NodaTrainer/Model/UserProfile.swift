//
//  UserProfile.swift
//  NodaTrainer
//
//  Created by sangeles on 5/4/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import Foundation

class UserProfile {
    var uid:String
    var username:String
    var photoURL:URL
    
    init(uid:String, username:String, photoURL:URL) {
        self.uid = uid
        self.username = username
        self.photoURL = photoURL
    }
}
