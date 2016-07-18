//
//  StatkNotifierInfo.swift
//  StackNoti
//
//  Created by cetauri on 7/15/16.
//  Copyright © 2016 smc. All rights reserved.
//

import Foundation
import UIKit

class StatkNotifierInfo {
    var view:UIView = UIView()
    var target:UIView = UIView()
    var uuid:String = CFUUIDCreateString(nil, CFUUIDCreate(nil)) as String
    
    init(view:UIView, target:UIView) {
        self.view = view
        self.target = target
    }
    
}