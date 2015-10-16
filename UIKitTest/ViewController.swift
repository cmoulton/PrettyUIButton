//
//  ViewController.swift
//  UIKitTest
//
//  Created by Christina Moulton on 2015-01-21.
//  Copyright (c) 2015 Teak Mobile Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var button: UIButton?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Make button half the view height with a 20 pixel margin
    button = UIButton()
    var buttonFrame = self.view.frame
    var xMargin:CGFloat = 20.0
    var yTopMargin:CGFloat = 40.0
    buttonFrame.origin.x += xMargin
    buttonFrame.origin.y += yTopMargin
    buttonFrame.size.width -= 2.0*xMargin
    buttonFrame.size.height /= 3.0
    button?.frame = buttonFrame
    
    // Make button gray and add a title
    button?.backgroundColor = UIColor.lightGrayColor()
    button?.setTitle("Oh Canada!", forState: UIControlState.Normal)
    var buttonImage = UIImage(named: "Canada")
    button?.setImage(buttonImage, forState: UIControlState.Normal)
    // Handle button being tapped
    button?.addTarget(self, action: Selector("didTouchButton"), forControlEvents: UIControlEvents.TouchUpInside)
    
    self.view.addSubview(button!)
  }
  
  func didTouchButton() {
    // When button is tapped, make it pretty
    // round the corners
    button?.layer.cornerRadius = 8.0
    // add a border
    button?.layer.borderColor = UIColor.darkGrayColor().CGColor
    button?.layer.borderWidth = 2.0
    // change the text color
    button?.setTitleColor(UIColor.darkTextColor(), forState: UIControlState.Normal)
    // change the text font & make it bigger
    button?.titleLabel?.font = UIFont.italicSystemFontOfSize(28.0)
    
    // set the colors for the subviews of the button so we can see where they are
    //button?.titleLabel?.backgroundColor = UIColor.yellowColor()
    //button?.imageView?.backgroundColor = UIColor.orangeColor()
    
    // Make the image smaller and move it to the left so we have room for the title
    button?.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 110)
    
    // Move the title to the right: the negative left value stretches it to the right, making it wider by 80 pixels. Setting a larger right value would just move the label without making it wider. The right: 10 value moves the title 10 pixels away from the right edge of the button
    // And move it down so it's not overlapping the image (top: 180 move it down 180 pixels, without making it taller. That's ok because it's already tall enough)
    button?.titleEdgeInsets = UIEdgeInsets(top: 180, left: -80, bottom: 0, right: 10)
    
    // rotate the whole button
    var rotationTransform = CATransform3DMakeRotation(-CGFloat(M_PI)/20, 0, 0, 1.0)
    button?.layer.transform = rotationTransform
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

