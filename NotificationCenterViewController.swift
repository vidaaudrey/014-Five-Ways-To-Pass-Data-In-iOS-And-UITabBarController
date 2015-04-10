//
//  NotificationCenterViewController.swift
//  014-Passing-Data
//
//  Created by Audrey Li on 4/9/15.
//  Copyright (c) 2015 shomigo.com. All rights reserved.
//

import UIKit

//Define an identifer to name this particular type of notification
//Subscribe to this kind of notification by adding an observer to a notification center for notifications with the given name. You can instatiate new notification centers, but it is common to use NSNotificationCenter.defaultCenter.
//Publish notifications to the notification center. You might include additional data in a userInfo dictionary.


//The NSNotificationCenter API is normally used to handle app-wide events that may be relevant to multiple interested—possibly unrelated—view controllers (e.g. the logged in state of a user). It is not normally used to pass information between two specific view controllers. 

class NotificationCenterViewController: UIViewController {
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
        let dvc = storyboard.instantiateViewControllerWithIdentifier("notificationCenterDes") as NotificationCenterDesViewController
        
        dvc.data = view.backgroundColor

        NSNotificationCenter.defaultCenter().addObserverForName(DataPickerNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification: NSNotification?) -> Void in
            let userInfo = notification?.userInfo
            let selectedData: UIColor? = userInfo?[DataPickerSelectedDataKey] as? UIColor
            self.didPickData(selectedData)
        }
        
        presentViewController(dvc, animated: true, completion: nil)
        
        
    }
    
    func didPickData(data: UIColor?) {
        if let selectedData = data {
           iconView.updateIcon("segue", color: selectedData, alpha: 0.1)
        }
        dismissViewControllerAnimated(true, completion: nil)
    }


}
