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
        
        initialize()
    }
    
    func initialize() {
        checkCurrentStep()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        layout.minimumInteritemSpacing = 7
        layout.minimumLineSpacing = 7
        
        collectionView?.collectionViewLayout = layout
        collectionView?.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView")
        
        manager.fetch { (items) in
            self.data = items
            self.collectionView.reloadData()
        }
    }
    
    func next() {
        if currentStep < 4 {
            currentStep += 1
        }
        
        checkCurrentStep()
    }
    
    func previous() {
        if currentStep > 1 {
            currentStep -= 1
        }
        
        checkCurrentStep()
    }
    
    func checkCurrentStep() {
        switch currentStep {
        case 1:
            stepTwoImg.image = UIImage(named: "unselected-step-bg")
            stepTwoLine.backgroundColor = #colorLiteral(red: 0.90200001, green: 0.8709999919, blue: 0.8669999838, alpha: 1)
            showStepOne()
        case 2:
            stepThreeImg.image = #imageLiteral(resourceName: "unselected-step-bg")
            stepThreeLine.backgroundColor = #colorLiteral(red: 0.90200001, green: 0.8709999919, blue: 0.8669999838, alpha: 1)
            showStepTwo()
        case 3:
            stepFourImg.image = UIImage(named: "unselected-step-bg")
            stepFourLine.backgroundColor = #colorLiteral(red: 0.90200001, green: 0.8709999919, blue: 0.8669999838, alpha: 1)
            showStepThree()
        case 4:
            showStepFour()
        default:
            print("not setup")
        }
        
        lblStep.text = "\(currentStep)"
        lblDesc.text = titles[currentStep-1]
        checkButtons()
    }
    
    func reset() {
        galleryView.isHidden = true
        titleView.isHidden = true
        calendarView.isHidden = true
        confirmView.isHidden = true
    }
    
    func checkButtons() {
        if currentStep == 4 {
            btnNext.setTitle("Send", for: .normal)
        }
        else {
            btnNext.setTitle("Next", for: .normal)
        }
        
        if currentStep == 1 {
            btnPrevious.isHidden = true
        }
        else {
           btnPrevious.isHidden = false
        }
    }
    
    func showStepOne() {
        reset()
        titleView.isHidden = false
    }
    
    func showStepTwo() {
        reset()
        updateEventTitle()
        stepTwoImg.image = #imageLiteral(resourceName: "selected-step-bg.pdf")
        stepTwoLine.backgroundColor = #colorLiteral(red: 0.9649999738, green: 0.2509999871, blue: 0.3799999952, alpha: 1)
        galleryView.isHidden = false
    }
    
    func showStepThree() {
        reset()
        stepThreeImg.image = #imageLiteral(resourceName: "selected-step-bg.pdf")
        stepThreeLine.backgroundColor = #colorLiteral(red: 0.9649999738, green: 0.2509999871, blue: 0.3799999952, alpha: 1)
        calendarView.isHidden = false
    }
    
    func showStepFour() {
        reset()
        
        imgConfirm.image = UIImage(named: eventImage)
        lblConfirmDate.text = "Date: \(eventDate)"
        lblConfirmTitle.text = eventTitle
        
        stepFourImg.image = #imageLiteral(resourceName: "selected-step-bg.pdf")
        stepFourLine.backgroundColor = #colorLiteral(red: 0.9649999738, green: 0.2509999871, blue: 0.3799999952, alpha: 1)
        confirmView.isHidden = false
    }
    
    func updateEventTitle() {
        guard let title = tfEventTitle.text else { return }
        eventTitle = title
    }
    
    func updateEvent(image: String) {
        eventImage = image
    }
    
    func updateEvent(date: String) {
        eventDate = date
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction func onNextTapped(_ sender: Any) {
        guard let title = btnNext.titleLabel?.text else { return }
        
        if title == "Next" {
            next()
        }
        else {
            let event = Event()
            event.date = eventDate
            event.title = eventTitle
            event.image = eventImage
            
            delegate.didCreate(with: event)
        }
    }
    
    @IBAction func onPreviousTapped(_ sender: Any) {
        previous()
    }
}









