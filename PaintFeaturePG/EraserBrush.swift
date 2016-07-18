//
//  EraserBrush.swift
//  PaintFeaturePG
//
//  Created by 默司 on 2016/7/18.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit

class EraserBrush: PencilBrush {
    override func drawInContext(context: CGContextRef) {
        CGContextSetBlendMode(context, .Clear)
        
        super.drawInContext(context)
    }
}
