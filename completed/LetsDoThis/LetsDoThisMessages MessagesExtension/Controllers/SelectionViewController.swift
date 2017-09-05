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
        setDefaults()
    }
    
    func setDefaults() {
        if let date = event.date { lblDate.text = date }
        if let image = event.image { imgEvent.image = UIImage(named: image) }
        
        lblTitle.text = event.title
    }
    
    @IBAction func onYesTapped(_ sender: Any) {
        event.attending += 1
        delegate.userWillAttend(with: event)
    }
    
    @IBAction func onNoTapped(_ sender: Any) {
        event.notAttending += 1
        delegate.userWillNotAttend(with: event)
    }
}





