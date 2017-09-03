//
//  CreateViewController.swift
//  RSVPMessages MessagesExtension
//
//  Created by Craig Clayton on 9/1/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit

protocol CreateViewControllerDelegate: class {
    func didCreate(with event: Event)
}

class CreateViewController: UIViewController {
    
    weak var delegate: CreateViewControllerDelegate!
    
    @IBOutlet weak var lblStep: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrevious: UIButton!
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    
    // Step One
    @IBOutlet weak var titleView: UIView!
    
    // Step Two
    @IBOutlet weak var galleryView: UIView!
    
    // Step Three
    @IBOutlet weak var calendarView: FSCalendar!
    
    // Step Four
    @IBOutlet weak var confirmView: UIView!
    @IBOutlet weak var lblConfirmDate: UILabel!
    @IBOutlet weak var imgConfirm: UIImageView!
    @IBOutlet weak var lblConfirmTitle: UILabel!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tfEventTitle: UITextField!
    
    @IBOutlet weak var stepTwoLine: UIView!
    @IBOutlet weak var stepTwoImg: UIImageView!
    
    @IBOutlet weak var stepThreeLine: UIView!
    @IBOutlet weak var stepThreeImg: UIImageView!
    
    @IBOutlet weak var stepFourLine: UIView!
    @IBOutlet weak var stepFourImg: UIImageView!
    
    
    var eventTitle = ""
    var eventDate = ""
    var eventImage = ""
    var currentStep = 1
    var data:[PhotoItem] = []
    var titles = [
        "SELECT A TITLE",
        "SELECT AN IMAGE",
        "SELECT DATES",
        "CONFIRM MESSAGE"]
    
    var selectedIndexPath: IndexPath = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()

    let manager = EventDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupCollectionView() {
        // add code here
    }
    
    
    
    func next() {
        // add code here
    }
    
    func previous() {
        // add code here
    }
    
    func checkCurrentStep() {
        // add code here
    }
    
    func reset() {
        // add code here
    }
    
    func checkButtons() {
        // add code here
    }
    
    func showStepOne() {
        // add code here
    }
    
    func showStepTwo() {
        // add code here
    }
    
    func showStepThree() {
        // add code here
    }
    
    func showStepFour() {
        // add code here
    }
    
    func updateEventTitle() {
        // add code here
    }
    
    func updateEvent(image: String) {
        // add code here
    }
    
    func updateEvent(date: String) {
        // add code here
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction func onNextTapped(_ sender: Any) {
        // add code here
    }
    
    @IBAction func onPreviousTapped(_ sender: Any) {
        // add code here
    }
}



