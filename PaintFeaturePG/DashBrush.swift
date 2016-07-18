//
//  DashBrush.swift
//  PaintFeaturePG
//
//  Created by 默司 on 2016/7/18.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit

class DashBrush: LineBrush {
    override func drawInContext(context: CGContextRef) {
        let lengths: [CGFloat] = [strokeWidth * 3, strokeWidth * 3]
        CGContextSetLineDash(context, 0, lengths, 2)
        
        super.drawInContext(context)
    }
}
