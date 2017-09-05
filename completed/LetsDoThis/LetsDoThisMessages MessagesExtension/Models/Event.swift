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
        guard let url = message?.url, let components = NSURLComponents(url: url, resolvingAgainstBaseURL: false), let items = components.queryItems else { return }
        
        print(url)
        
        for queryItem in items  {
            if queryItem.name == "title" {
                self.title = queryItem.value
            }
            
            if queryItem.name == "image" {
                self.image = queryItem.value
            }
            
            if queryItem.name == "date" {
                self.date = queryItem.value
            }
            
            if queryItem.name == "attending" {
                guard let value = queryItem.value else { return }
                self.attending = Int(value)!
            }
            
            if queryItem.name == "notAttending" {
                guard let value = queryItem.value else { return }
                self.notAttending = Int(value)!
            }
        }
    }
}















