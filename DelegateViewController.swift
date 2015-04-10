//
//  DelegateViewController.swift
//  014-Passing-Data
//
//  Created by Audrey Li on 4/8/15.
//  Copyright (c) 2015 shomigo.com. All rights reserved.
//

import UIKit

protocol DelegateDesDelegate: class {
    func dataPicker(picker:  DelegateDesViewController, didPickData data:UIColor?)
    func initalData() -> UIColor?
}

class DelegateViewController: UIViewController, DelegateDesDelegate {

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
        let dvc = storyboard.instantiateViewControllerWithIdentifier("delegateDes") as DelegateDesViewController
        dvc.delegate = self
        presentViewController(dvc, animated: true, completion: nil)
        
    }
    
    
    // delegate implementation 
    func dataPicker(picker: DelegateDesViewController, didPickData data: UIColor?) {
        if let selectedData = data {
            iconView.updateIcon("segue", color: selectedData, alpha: 0.1)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    func initalData() -> UIColor? {
        return view.backgroundColor
    }


}
