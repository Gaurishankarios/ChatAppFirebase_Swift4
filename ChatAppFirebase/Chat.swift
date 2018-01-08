//
//  Chat.swift
//  ChatAppFirebase
//
//  Created by Kushal on 05/01/18.
//  Copyright © 2018 Gaurishankar. All rights reserved.
//

import UIKit

class Chat {

    var userName:String
    var text:String
    var datePost:String
    
    init(userName:String,text:String,datePost:String) {
        self.userName=userName
        self.text=text
        self.datePost=datePost
    }
}
