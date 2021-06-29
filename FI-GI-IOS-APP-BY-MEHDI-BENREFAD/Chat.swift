//
//  Message.swift
//  FI-GI-IOS-APP-BY-MEHDI-BENREFAD
//
//  Created by Mehdi Benrefad on 29/06/2021.
//  Copyright © 2021 Mehdi Benrefad. All rights reserved.
//

import UIKit

class Chat {
    var username: String?
    var text: String?
    var DatePost: String?
    
    init(username:String,text:String, DatePost:String) {
        self.username = username
        self.text = text
        self.DatePost = DatePost
    }
}
