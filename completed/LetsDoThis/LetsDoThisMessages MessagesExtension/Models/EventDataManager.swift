//
//  StepTwoManager.swift
//  LetsDoThisMessage MessagesExtension
//
//  Created by Craig Clayton on 9/1/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit

class EventDataManager: NSObject {

    func fetch(completionHandler:(_ items:[PhotoItem]) -> Swift.Void) {
        if let file = Bundle.main.url(forResource: "EventImageData", withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: file)
                let items = try JSONDecoder().decode([PhotoItem].self, from: data)
                
                completionHandler(items)
            }
            catch { completionHandler([]) }
        }
    }
}
