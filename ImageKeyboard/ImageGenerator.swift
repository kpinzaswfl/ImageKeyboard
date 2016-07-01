//
//  ImageGenerator.swift
//  ImageDemo
//
//  Created by Karen Pinzás on 30/6/16.
//  Copyright © 2016 Karen Pinzás. All rights reserved.
//

import UIKit

class ImageGenerator {
    
    static func random() -> UIImage {
        
        let size = CGSize(width: 100, height: 100)
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let path = UIBezierPath()
        path.moveToPoint(randomPoint(inRect: rect))
        
        for _ in 1...3 {
            
            path.addLineToPoint(randomPoint(inRect: rect))
            
        }
        
        path.closePath()
        
        path.lineWidth = 3
        UIColor.redColor().setStroke()
        
        path.stroke()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        
        return image
        
        
    }
    
    private static func randomPoint(inRect rect: CGRect) -> CGPoint {
        
        func random(between firstValue: CGFloat, and secondValue: CGFloat) -> CGFloat {
            let randomValue = CGFloat(arc4random()) / CGFloat(UInt32.max)
            
            return randomValue * (firstValue - secondValue) + secondValue
            
        }
        
        let x = random(between: rect.minX, and: rect.maxX)
        let y = random(between: rect.minY, and: rect.maxY)
        
        return CGPoint(x: x, y: y)
        
    }
    
}
