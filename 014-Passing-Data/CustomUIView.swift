//
//  CustomUIView.swift
//  014-Passing-Data
//
//  Created by Audrey Li on 4/9/15.
//  Copyright (c) 2015 shomigo.com. All rights reserved.
//

import UIKit

class CustomUIView: UIView {

    var color: Color!
    var name: String!
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!)
        self.color = Color(color: MDColors.blue.P500, alpha: 0.2)
       
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!)
        self.color = Color(color: MDColors.blue.P500, alpha: 0.2)
    }

    func updateIcon(name:String, color localColor: Color?, alpha: CGFloat?) {
        let localAlpha = alpha ?? 0.4
        let localColorWithoutAlpha = localColor ?? MDColors.red.A700
        self.color = Color(color: localColorWithoutAlpha, alpha: localAlpha)
        
        self.name = name
        setNeedsDisplay()
        
    }

    override func drawRect(rect: CGRect) {
       let square = rect.insetSquare(rect, dx: 50)
        
        if name != nil {
            switch name {
                case "segue":  StyleKit.drawSegue(frame: square, iconColor: color)
                case "delegat":  StyleKit.drawDelegat(frame: square, iconColor: color)
                case "block": StyleKit.drawBlock(frame: square, iconColor: color)
                case "kvo": StyleKit.drawKvo(frame: square, iconColor: color)
                case "notification": StyleKit.drawNotification(frame: square, iconColor: color)
            default:  break
            }
        }
    }
    

}

extension CGRect {
    func insetMaxSquare(rect: CGRect) -> CGRect {
        var width = rect.width < rect.height ? rect.width : rect.height
        return CGRect(x: rect.midX - rect.width / 2, y: rect.midY - rect.width / 2, width: width, height: width)
    }
    
    func insetSquare(rect: CGRect, dx: CGFloat) -> CGRect {
        if rect.width < rect.height {
            var width = rect.width
            return CGRect(x: rect.midX - rect.width / 2 + dx, y: rect.midY - rect.width / 2 + dx, width: width - 2 * dx, height: width - 2 * dx)
        } else {
            return CGRect(x: rect.midX - rect.height / 2 + dx, y: rect.midY - rect.height / 2 + dx, width: height - 2 * dx, height: height - 2 * dx)
        }
        
    }
}