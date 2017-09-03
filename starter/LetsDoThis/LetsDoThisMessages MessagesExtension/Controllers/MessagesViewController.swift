//
//  MessagesViewController.swift
//  RSVPMessages MessagesExtension
//
//  Created by Craig Clayton on 9/1/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func presentViewController(with conversation: MSConversation, for presentationStyle: MSMessagesAppPresentationStyle) {
        // add code here
    }
    
    private func createFormViewController() -> UIViewController {
        // add code here
        return UIViewController()
    }
    
    private func createSelectionViewController(with event: Event) -> UIViewController {
        // add code here
        return UIViewController()
    }
    
    
    private func createCompactViewController() -> UIViewController {
        // add code here
        return UIViewController()
    }
    
    private func composeMessage(with event: Event) -> MSMessage {
        // add code here
        return MSMessage()
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // add code here
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // add code here
    }
}

extension MessagesViewController: CompactDelegate {
    func createRSVP() {
        // add code here
    }
}

extension MessagesViewController: CreateViewControllerDelegate {
    
    func didCreate(with event: Event) {
        // add code here
    }
}

extension MessagesViewController: SelectionViewControllerDelegate {
    func userWillAttend(with event: Event) {
        // add code here
    }
    
    func userWillNotAttend(with event: Event) {
        // add code here
    }
}
