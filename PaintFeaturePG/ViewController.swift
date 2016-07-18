//
//  ViewController.swift
//  PaintFeaturePG
//
//  Created by 默司 on 2016/7/18.
//  Copyright © 2016年 默司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var paintableImageView: PaintableImageView!
    
    var brushes = [PencilBrush(), LineBrush(), DashBrush(), RectangleBrush(), CircleBrush(), EraserBrush()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        paintableImageView.brush = brushes[0]
    }
    
    @IBAction func switchBrush(sender: UISegmentedControl) {
        assert(sender.tag < self.brushes.count, "!!!")
        
        paintableImageView.brush = brushes[sender.selectedSegmentIndex]
    }
    
    //@IBAction func rotate(sender: AnyObject) {
    //UIView.animateWithDuration(0.3) {
    //self.paintableImageView.transform = CGAffineTransformRotate(self.paintableImageView.transform, (90.0 * CGFloat(M_PI)) / 180.0)
    //}
    //}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

