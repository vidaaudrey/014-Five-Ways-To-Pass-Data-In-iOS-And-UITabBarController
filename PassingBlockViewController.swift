//
//  PassingBlockViewController.swift
//  014-Passing-Data
//
//  Created by Audrey Li on 4/9/15.
//  Copyright (c) 2015 shomigo.com. All rights reserved.
//

import UIKit

class PassingBlockViewController: UIViewController {
    
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
        let dvc = storyboard.instantiateViewControllerWithIdentifier("passingBlockDes") as PassingBlockDesViewController
        
        dvc.data = view.backgroundColor
        dvc.doneHandler = { self.didPickData($0) }
        
        presentViewController(dvc, animated: true, completion: nil)
        
    }
    
    func didPickData(data: UIColor?) {
        if let selectedData = data {
            iconView.updateIcon("segue", color: selectedData, alpha: 0.1)
        }
     //   view.backgroundColor = data ?? view.backgroundColor
        dismissViewControllerAnimated(true, completion: nil)
    }


}
