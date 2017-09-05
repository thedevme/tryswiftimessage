//
//  CreateViewControllerExtension.swift
//  RSVPMessages MessagesExtension
//
//  Created by Craig Clayton on 9/2/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import Foundation

extension CreateViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[section].items.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCell
        let item = data[indexPath.section].items[indexPath.row]
        
        var borderColor = UIColor.clear.cgColor
        var borderWidth: CGFloat = 0
        
        if indexPath == selectedIndexPath {
            borderColor = #colorLiteral(red: 0.9649999738, green: 0.2509999871, blue: 0.3799999952, alpha: 1).cgColor
            borderWidth = 3
        }
        else {
            borderColor = UIColor.clear.cgColor
            borderWidth = 0
        }
        
        cell.layer.borderWidth = borderWidth
        cell.layer.borderColor = borderColor
        
        cell.set(image: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width - 21
        let cellWidth = screenWidth / 2.0
        
        return CGSize(width: cellWidth, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let screenRect = UIScreen.main.bounds
        
        return CGSize(width: screenRect.size.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as! HeaderView
        setContentHeaderToView(view: headerView, index: indexPath)
        
        return headerView
    }
    
    func setContentHeaderToView(view: HeaderItemViewProtocol, index: IndexPath) {
        let name = data[index.section].name
        view.set(title: name)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = data[indexPath.section].items[indexPath.row]
        selectedIndexPath = indexPath
        
        updateEvent(image: image)
    }
}

extension CreateViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        updateEvent(date: self.formatter.string(from: date))
        
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
    }
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarHeightConstraint.constant = bounds.height
        self.view.layoutIfNeeded()
    }
}












