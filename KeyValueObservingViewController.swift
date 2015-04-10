//
//  KeyValueObservingViewController.swift
//  014-Passing-Data
//
//  Created by Audrey Li on 4/9/15.
//  Copyright (c) 2015 shomigo.com. All rights reserved.
//

import UIKit

//Register an object for observation by calling addObserver:forKeyPath:
//Implement observeValueForKeyPath in the class doing the observing
//Update properties in object being observed with the corresponding keyPath.

class KeyValueObservingViewController: UIViewController {
    private var dataPickerObservationContext = 0
    private let selectedDataKeyPath = "selectedData"
    
     @IBOutlet var iconView: CustomUIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        iconView.frame = view.bounds
        iconView.setNeedsDisplay()
    }

    
    @IBAction func pickBtnTapped(sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let dvc = storyboard.instantiateViewControllerWithIdentifier("keyValueObservingDes") as KeyValueObservingDesViewController
        
        dvc.data = view.backgroundColor
        
        dvc.addObserver(self, forKeyPath: selectedDataKeyPath, options:NSKeyValueObservingOptions.New, context: &dataPickerObservationContext)
        presentViewController(dvc, animated: true, completion: nil)

        
    }
    
    func didPickData(data: UIColor?) {
        if let selectedData = data {
            iconView.updateIcon("segue", color: selectedData, alpha: 0.1)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if context == &dataPickerObservationContext && keyPath == selectedDataKeyPath && object is KeyValueObservingDesViewController{
            
            let dvc = object as KeyValueObservingDesViewController
            dvc.removeObserver(self, forKeyPath: selectedDataKeyPath, context: &dataPickerObservationContext)
            
            let selectedData = change[NSKeyValueChangeNewKey] as UIColor
            didPickData(selectedData)
        }
    }

    
}
