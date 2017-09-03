//
//  Poll.swift
//  RSVPMessages MessagesExtension
//
//  Created by Craig Clayton on 9/1/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit
import Messages

class Event: NSObject  {
    var title: String!
    var date: String!
    var image: String!
    var attending = 0
    var notAttending = 0
    
    
    init(with message: MSMessage? = nil) {
        // add code here
    }
}
