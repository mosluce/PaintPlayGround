//
//  PencilBrush.swift
//  PaintFeaturePG
//
//  Created by 默司 on 2016/7/18.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit

class PencilBrush: BaseBrush {
    override func drawInContext(context: CGContextRef) {
        if let lastPoint = lastPoint {
            CGContextMoveToPoint(context, lastPoint.x, lastPoint.y)
        } else {
            CGContextMoveToPoint(context, beginPoint.x, beginPoint.y)
        }
        
        CGContextAddLineToPoint(context, endPoint.x, endPoint.y)
    }
    
    override func supportedContinuousDrawing() -> Bool {
        return true
    }
}
