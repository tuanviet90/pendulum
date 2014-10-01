//
//  ViewController.swift
//  pendulumswift
//
//  Created by VietMinSK on 10/1/14.
//  Copyright (c) 2014 VietMinsk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pendulum: UIImageView!
    @IBOutlet weak var sliderAngle: UISlider!
    var MAX_ANGLE = M_PI_4 * 0.5
    var _timer : NSTimer?
    var _angle : Double = 0.0
    var _angleDelta : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let size : CGSize = self.pendulum.bounds.size
    self.pendulum.layer.anchorPoint = CGPointMake(0.5, 0)
    self.pendulum.frame = CGRectMake((self.view.bounds.size.width - size.width) * 0.5, 20, size.width, size.height)
        
        _angle = 0.0
        _angleDelta = 0.05
    }
    func startAnimation() {
        _timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "animatePendulum:", userInfo: nil, repeats: true)
        _timer?.fire()
    }
    
    @IBAction func startStopAnimation(sender: UISwitch) {
        if sender.on {
            self.startAnimation()
        } else {
            _timer?.invalidate()
        }
        
    }
    
    func animatePendulum(sender: NSTimer) {
        _angle = _angle + _angleDelta
        if (_angle > MAX_ANGLE) | (_angle < -MAX_ANGLE){
            _angleDelta = -_angleDelta
        }
        self.pendulum?.transform = CGAffineTransformMakeRotation(CGFloat(_angle))
        NSLog("%3.2f - %3.2f", self.pendulum!.center.x, self.pendulum!.center.y)
        

}

    @IBAction func changeAngle(sender: UISlider) {
        self.pendulum?.transform = CGAffineTransformMakeRotation(CGFloat(MAX_ANGLE) * CGFloat(sender.value))
    
    }
}
