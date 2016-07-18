//
//  BaseBrush.swift
//  PaintFeaturePG
//
//  Created by 默司 on 2016/7/18.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit
import CoreGraphics

protocol PaintBrush {
    func supportedContinuousDrawing() -> Bool
    func drawInContext(context: CGContextRef) -> Void
}

class BaseBrush: NSObject, PaintBrush {
    var beginPoint: CGPoint!
    var endPoint: CGPoint!
    var lastPoint: CGPoint?
    
    var strokeWidth: CGFloat!
    
    func supportedContinuousDrawing() -> Bool {
        return false
    }
    
    func drawInContext(context: CGContextRef) {
        assert(false, "must implements in subclass.")
    }
}
