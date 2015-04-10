//
//  NotificationCenterDesViewController.swift
//  014-Passing-Data
//
//  Created by Audrey Li on 4/9/15.
//  Copyright (c) 2015 shomigo.com. All rights reserved.
//

import UIKit

let DataPickerNotification = "com.shomigo.NotificationCenterDesViewController.didPickData"
let DataPickerSelectedDataKey = "com.shomigo.NotificationCenterDesViewController.selectedData"

class NotificationCenterDesViewController: UIViewController {

    @IBOutlet weak var segControl: UISegmentedControl!
    
    var data: AnyObject?
    let segControlData = [("blue", MDColors.blue.A700), ("green", MDColors.green.A400), ("orange", MDColors.orange.A400), ("red", MDColors.red.A400)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segControl.removeAllSegments()
        var selectedIndex = UISegmentedControlNoSegment
        
        for (index,color) in enumerate(segControlData) {
            if color.1 == data as Color {
                selectedIndex = index
            }
            segControl.insertSegmentWithTitle(color.0, atIndex: index, animated: false)
        }
        
        segControl.selectedSegmentIndex = selectedIndex
        
    }
    
    func dataFromSelection() -> Color? {
        let selectedIndex = segControl.selectedSegmentIndex
        if selectedIndex != UISegmentedControlNoSegment {
            return segControlData[selectedIndex].1
        }
        return nil
    }
    
    //We already registered the ViewController as listener to changes in this property above. Any change will then automatically trigger the observeValueForKeyPath method in ViewController
    @IBAction func segmentedControlValueChanged(){
        var selectionInfo:[NSObject: AnyObject] = [:]
        if let selectedData = dataFromSelection() {
            selectionInfo[DataPickerSelectedDataKey] = selectedData
        }
        NSNotificationCenter.defaultCenter().postNotificationName(DataPickerNotification, object: self, userInfo: selectionInfo)
    }
    
    @IBAction func doneBtnTapped(sender: UIButton) {
        var selectionInfo:[NSObject: AnyObject] = [:]
        if let selectedData = dataFromSelection() {
            selectionInfo[DataPickerSelectedDataKey] = selectedData
        }
        NSNotificationCenter.defaultCenter().postNotificationName(DataPickerNotification, object: self, userInfo: selectionInfo)
    }
    

}
