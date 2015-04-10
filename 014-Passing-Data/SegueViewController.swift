//
//  SegueViewController.swift
//  014-Passing-Data
//
//  Created by Audrey Li on 4/8/15.
//  Copyright (c) 2015 shomigo.com. All rights reserved.
//

import UIKit

class SegueViewController: UIViewController {


    @IBOutlet weak var iconView: CustomUIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        imageView.tintColor = MDColors.blue.A700
//        // the tintColor setting override the drawign color as the image is rendered in template mode
//        imageView.image = StyleKit.imageOfNotification(frame: imageView.bounds, iconColor: UIColor.redColor())
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        iconView.frame = view.bounds
        iconView.setNeedsDisplay()
    }
//    override func updateViewConstraints() {
//        super.updateViewConstraints()
//        iconView.setNeedsDisplay()
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue" {
            let dvc = segue.destinationViewController as SegueDesViewController
            dvc.data = view.backgroundColor
        }
    }
    
    func didPickData(segue: UIStoryboardSegue) {
        let svc = segue.sourceViewController as SegueDesViewController
        if let selectedData = svc.dataFromSelection() {

            UIApplication.sharedApplication().keyWindow?.tintColor = selectedData
            
            iconView.updateIcon("segue", color: selectedData, alpha: 0.4)
            
           
        }
        
    }

}
