//
//  ViewController.swift
//  ColorSizeSlider
//
//  Created by Cardasis, Jonathan (J.) on 6/30/16.
//  Copyright © 2016 Cardasis, Jonathan (J.). All rights reserved.
//

import UIKit

/* A test viewcontroller */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let condensedFrame = CGRect(x: 280, y: 30, width: 32, height: 32) //Width and Height should be equal
        let fancyControl = SizeSlideButton(condensedFrame: condensedFrame)
        
        //let fancyControl = SizeSlideButton(frame: CGRect(x: 10, y: 30, width: 352, height: 32))
        
        
        /* Additional Setup */
        fancyControl.trackColor = UIColor.whiteColor()
        fancyControl.handle.color = UIColor(red: 255/255.0, green: 111/255.0, blue: 0, alpha: 1)
        //fancyControl.handlePadding = 0.0 //Add no extra padding around the handle
            //handlePadding works best as <= leftSideRadius
        
        
        fancyControl.addTarget(self, action: #selector(sizeSelected), forControlEvents: .ValueChanged)
        fancyControl.addTarget(self, action: #selector(sizeSliderTapped), forControlEvents: .TouchUpInside)
        self.view.addSubview(fancyControl)
        
        
        
        
        
        //fancyControl.frame = CGRect(x: 50, y: 130, width: 200, height: 50)
        //fancyControl.handlePadding = 0.0
        
        
        //A button to test for click-through on the fancyControl
        let debugBtn = UIButton(frame: CGRect(x: 30, y: 30, width: 100, height: 32))
        debugBtn.backgroundColor = UIColor.redColor();
        debugBtn.titleLabel?.text = "HELLO";
        debugBtn.addTarget(self, action: #selector(test), forControlEvents: .TouchUpInside)
        
        self.view.insertSubview(debugBtn, belowSubview: fancyControl)
    }
    
    func sizeSelected(sender: SizeSlideButton){
        print("The new size is: \(sender.currentSize)")
        print("Value: \(sender.value)")
    }
    
    func sizeSliderTapped(sender: SizeSlideButton){
        print("reach")
        //Do something when the button is tapped
    }
    
    
    func test(){
        print("Clickarooo!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
/*
 
 Document:
 
 .TouchUpInside is called when a TAP has finished
 .ValueChanged is called when the slider was let go
 .TouchDown is called both when a long press is detected or a regular touch is detected
 
 
 + Use `currentSize` to obtain the size the person has selected
 + Use `handlePadding` to adjust the padding around the handle (default is set is the left side radius). Works best as <= leftSideRadius
 + Set the handle color by using `fancyControl.handle.color = UIColor.someColor()` to change its color
 + `trackColor` sets the color of the track
 + Use `value` to obtain a value between 0 and 1.0 of the slider
 
 */

