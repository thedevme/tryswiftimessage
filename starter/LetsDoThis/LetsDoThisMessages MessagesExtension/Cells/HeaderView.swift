//
//  HeaderView.swift
//  RSVPMessages MessagesExtension
//
//  Created by Craig Clayton on 9/2/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit

protocol HeaderItemViewProtocol: class {
    func set(title:String)
}

class HeaderView: UICollectionReusableView, HeaderItemViewProtocol {
    
    @IBOutlet weak var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(title: String) {
        // add code here
    }
}
