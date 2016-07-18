//
//  PaintableImageView.swift
//  PaintFeaturePG
//
//  Created by 默司 on 2016/7/18.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit
import CoreGraphics

enum DrawingState {
    case Began, Moved, Ended
}

class PaintableImageView: UIImageView {
    
    private var drawingState: DrawingState! = .Ended
    private var realImage: UIImage?
    
    var strokeColor: UIColor!
    var strokeWidth: CGFloat!
    var brush: BaseBrush?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        strokeWidth = 5
        strokeColor = UIColor.redColor()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = brush {
            brush.lastPoint = nil
            
            brush.beginPoint = touches.first!.locationInView(self)
            brush.endPoint = brush.beginPoint
            
            drawingState = .Began
            drawingImage()
        }
        
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = brush {
            brush.endPoint = touches.first!.locationInView(self)
            
            drawingState = .Moved
            drawingImage()
        }
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if let brush = brush {
            brush.endPoint = nil
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let brush = brush {
            brush.endPoint = touches.first!.locationInView(self)
            
            drawingState = .Ended
            drawingImage()
        }
    }
    
    private func drawingImage() {
        if let brush = brush {
            UIGraphicsBeginImageContext(self.bounds.size)
            
            let context = UIGraphicsGetCurrentContext()!
            
            UIColor.clearColor().setFill()
            UIRectFill(self.bounds)
            
            CGContextSetLineCap(context, .Round)
            CGContextSetLineWidth(context, strokeWidth)
            CGContextSetStrokeColorWithColor(context, strokeColor.CGColor)
            
            if let realImage = realImage {
                realImage.drawInRect(self.bounds)
            }
            
            brush.strokeWidth = strokeWidth
            brush.drawInContext(context)
            CGContextStrokePath(context)
            
            let previewImage = UIGraphicsGetImageFromCurrentImageContext()
            if drawingState == .Ended ||  brush.supportedContinuousDrawing() {
                self.realImage = previewImage
            }
            
            UIGraphicsEndImageContext()
            
            self.image = previewImage
            
            brush.lastPoint = brush.endPoint
        }
    }
    
}
