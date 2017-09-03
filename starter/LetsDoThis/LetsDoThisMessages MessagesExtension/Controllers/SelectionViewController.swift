//
//  SelectionViewController.swift
//  RSVPMessages MessagesExtension
//
//  Created by Craig Clayton on 9/1/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit

protocol SelectionViewControllerDelegate: class {
    func userWillAttend(with event: Event)
    func userWillNotAttend(with event: Event)
}

class SelectionViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgEvent: UIImageView!
    
    var event:Event!
    weak var delegate: SelectionViewControllerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        // add code here
    }
    
    func setDefaults() {
        // add code here
    }
    
    
    @IBAction func onYesTapped(_ sender: Any) {
        // add code here
    }
    
    @IBAction func onNoTapped(_ sender: Any) {
        // add code here
    }
}
