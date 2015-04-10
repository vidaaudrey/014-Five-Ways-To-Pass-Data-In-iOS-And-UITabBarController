//
//  PassingBlockDesViewController.swift
//  014-Passing-Data
//
//  Created by Audrey Li on 4/9/15.
//  Copyright (c) 2015 shomigo.com. All rights reserved.
//

import UIKit

class PassingBlockDesViewController: UIViewController {
    
    var data: AnyObject?
    var doneHandler:((UIColor?) -> Void)?
    
    let segControlData = [("blue", MDColors.blue.A700), ("green", MDColors.green.A400), ("orange", MDColors.orange.A400), ("red", MDColors.red.A400)]
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
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
    
    @IBAction func segmentedControlValueChanged(){
        doneHandler?(dataFromSelection())
    }
    
    @IBAction func doneBtnTapped(sender: UIButton) {
        doneHandler?(dataFromSelection())
    }
    

}
