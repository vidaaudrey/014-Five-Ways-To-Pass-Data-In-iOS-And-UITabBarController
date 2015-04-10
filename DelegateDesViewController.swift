//
//  DelegateDesViewController.swift
//  014-Passing-Data
//
//  Created by Audrey Li on 4/9/15.
//  Copyright (c) 2015 shomigo.com. All rights reserved.
//

import UIKit

class DelegateDesViewController: UIViewController {
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
    weak var delegate: DelegateDesDelegate?
    let segControlData = [("blue", MDColors.blue.A700), ("green", MDColors.green.A400), ("orange", MDColors.orange.A400), ("red", MDColors.red.A400)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segControl.removeAllSegments()
        
        let initialData = delegate?.initalData()
        var selectedIndex = UISegmentedControlNoSegment
        
        for (index,color) in enumerate(segControlData) {
            if color.1 == initialData {
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
    
    @IBAction func doneBtnTapped(sender: UIButton) {
        delegate?.dataPicker(self, didPickData: dataFromSelection())
    }
    
    
    @IBAction func segmentedControlValueChanged(){
       delegate?.dataPicker(self, didPickData: dataFromSelection())
    }



}
