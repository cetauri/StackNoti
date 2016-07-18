//
//  StatkNotifier.swift
//  StackNoti
//
//  Created by cetauri on 7/15/16.
//  Copyright © 2016 smc. All rights reserved.
//

import Foundation
import UIKit

class StatkNotifier {
    
    static let sharedInstance = StatkNotifier()
    var queueyArray = [StatkNotifierInfo]()
    
    func displayInView(view:UIView, target:UIView) -> Void {
        
        let info = StatkNotifierInfo(view: view, target:target)
        queueyArray.insert(info, atIndex: 0)
        display()
    }
    
    private func display(){
        
        var height:CGFloat = -1
        let buttomPadding:CGFloat = 10
        
        for i in 0 ... queueyArray.count - 1{
            
            let info = queueyArray[i]
            let uuid = info.uuid
            let view = info.view
            let target = info.target

            if view.superview != target {
                
                // first view
                let bounds = view.bounds
                height = bounds.size.height
                view.center = CGPointMake(target.center.x, height + buttomPadding - 100)
                target.addSubview(view)

                UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseInOut, animations: {

                    // XXX 어디로 빼야함
                    view.center = CGPointMake(target.center.x, height + buttomPadding)
                    
                }, completion: { _ in
                    
                    // 3.5초 있다가 사라짐
                    UIView.animateWithDuration(0.5, delay: 3.0, options: .CurveLinear, animations: {
                        view.alpha = 0.0
                        
                        }, completion: {_ in
                            view.removeFromSuperview()
                            self.removeByUUID(uuid)
                    })
                })
                
            } else {
                
                // move for rest views
                UIView.animateWithDuration(0.2, delay: 0, options: .CurveLinear, animations: {
                    
                    view.backgroundColor = UIColor.lightGrayColor()
                    var centerPoint = view.center
                    centerPoint.y = buttomPadding + centerPoint.y + height
                    view.center = centerPoint
                    
                },
                completion: nil)

            }

        }
    }
    
    private func removeByUUID(uuid:String){
        // Atomic
        
        for i in 0 ... queueyArray.count - 1{
            let info = queueyArray[i]

            if info.uuid == uuid{
                queueyArray.removeAtIndex(i)
                return
            }
        }
    }
    
    private init() {
        // super.init()
    }
}
