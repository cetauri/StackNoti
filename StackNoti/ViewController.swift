//
//  ViewController.swift
//  StackNoti
//
//  Created by cetauri on 7/15/16.
//  Copyright © 2016 smc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("start")
        NSTimer.scheduledTimerWithTimeInterval(1.0  , target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
//        update()
//        update()
    }
    
    func update() {
        print(NSDate())
        
        let view = UILabel(frame: CGRectZero)
        view.backgroundColor = UIColor.darkGrayColor()
        view.layer.cornerRadius = 10
        view.bounds.size = CGSizeMake(200, 50)
        view.text = "\(NSDate())"
//        let label = UILabel()
//        label.text = "\(NSDate())"
        view.sizeToFit()
//        label.center = view.center
//        view.addSubview(label)
        
        let snotifier = StatkNotifier.sharedInstance
        snotifier.displayInView(view, target:self.view)
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

