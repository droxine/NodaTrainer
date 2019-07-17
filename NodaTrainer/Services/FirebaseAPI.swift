//
//  File.swift
//  NodaTrainer
//
//  Created by sangeles on 6/27/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import Foundation
import Firebase

class FirebaseAPI {
    static let sharedInstance = FirebaseAPI()
    
    var currentUser:User?
    
    private init() {}
    
    func loadSignedInUser(_ userId:User?) {
        if self.currentUser == nil {
            self.currentUser = userId
        }
    }
    
    func retrieveUserId() -> String {
        if self.currentUser == nil {
            return ""
        } else {
            return self.currentUser!.uid
        }
    }
    
    func retrieveUserMail() -> String {
        if self.currentUser == nil {
            return ""
        } else {
            if self.currentUser!.email != nil {
                return self.currentUser!.email!
            } else {
                return ""
            }
        }
    }
}
