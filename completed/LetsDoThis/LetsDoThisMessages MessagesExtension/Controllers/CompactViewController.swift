//
//  CompactViewController.swift
//  RSVPMessages MessagesExtension
//
//  Created by Craig Clayton on 9/1/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit

protocol CompactDelegate: class {
    func createRSVP()
}

class CompactViewController: UIViewController {
    
    weak var delegate:CompactDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onCreateTapped(_ sender: Any) {
        delegate.createRSVP()
    }
    
}
