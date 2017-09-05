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
        
        var controller: UIViewController!
        
        if presentationStyle == .compact {
            controller = createCompactViewController()
        }
        else {
            if conversation.selectedMessage != nil {
                guard let message = conversation.selectedMessage else { return }
                controller = createSelectionViewController(with: Event(with: message))
            }
            else {
                controller = createFormViewController()
            }
        }
        
        for child in childViewControllers {
            child.willMove(toParentViewController: nil)
            child.view.removeFromSuperview()
            child.removeFromParentViewController()
        }
        
        addChildViewController(controller)
        
        controller.view.frame = self.view.bounds
        controller.view.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    private func createFormViewController() -> UIViewController {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "CreateViewController") as? CreateViewController else {
            fatalError("CreateViewController")
        }
        
        controller.delegate = self
        
        return controller
    }
    
    private func createSelectionViewController(with event: Event) -> UIViewController {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "SelectionViewController") as? SelectionViewController else {
            fatalError("SelectionViewController")
        }
        
        controller.delegate = self
        controller.event = event
        
        return controller
    }
    
    
    private func createCompactViewController() -> UIViewController {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "CompactViewController") as? CompactViewController else {
            fatalError("CompactViewController")
        }
        
        controller.delegate = self
        
        return controller
    }
    
    private func composeMessage(with event: Event) -> MSMessage {
        let session = activeConversation?.selectedMessage?.session
        let message = MSMessage(session: session ?? MSSession())
        let components = NSURLComponents()
        
        guard let title = event.title, let date = event.date, let image = event.image else { return message }
        
        components.queryItems = [
            URLQueryItem(name:"title", value: "\(title)"),
            URLQueryItem(name:"date", value: "\(date)"),
            URLQueryItem(name:"image", value: "\(image)"),
            URLQueryItem(name:"attending", value: "\(event.attending)"),
            URLQueryItem(name:"notAttending", value: "\(event.notAttending)")
        ]
        
        guard let url = components.url else { return MSMessage() }
        message.url = url
        
        let layout = MSMessageTemplateLayout()
        layout.image = UIImage(named: image)
        layout.caption = title
        layout.trailingCaption = date
        layout.subcaption = "😁: \(event.attending) 😔: \(event.notAttending)"
        
        message.layout = layout
        
        return message
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        presentViewController(with: conversation, for: presentationStyle)
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        guard let conversation = activeConversation else {
            fatalError("no active conversation found")
        }
        
        presentViewController(with: conversation, for: presentationStyle)
    }
}

extension MessagesViewController: CompactDelegate {
    func createRSVP() {
        requestPresentationStyle(.expanded)
    }
}

extension MessagesViewController: CreateViewControllerDelegate {
    
    func didCreate(with event: Event) {
        requestPresentationStyle(.compact)
        activeConversation?.insert(composeMessage(with: event), completionHandler: nil)
    }
}

extension MessagesViewController: SelectionViewControllerDelegate {
    func userWillAttend(with event: Event) {
        requestPresentationStyle(.compact)
        activeConversation?.insert(composeMessage(with: event), completionHandler: nil)
    }
    
    func userWillNotAttend(with event: Event) {
        requestPresentationStyle(.compact)
        activeConversation?.insert(composeMessage(with: event), completionHandler: nil)
    }
}









