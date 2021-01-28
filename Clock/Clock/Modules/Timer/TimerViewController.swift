//
//  TimerView.swift
//  Clock
//
//  Created by Duong Cuong on 30/12/20.
//  Copyright © 2020 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit

class TimerViewController: UIViewController {
    
    var shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // center view
        let center = view.center
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 200, startAngle: -CGFloat.pi / 2, endAngle: 3 * CGFloat.pi / 2, clockwise: true)
        // Create track layer
        var trackLayer = CAShapeLayer()
        trackLayer = createShape(path: circularPath.cgPath, strokeColor: UIColor.lightGray.cgColor, lineWidth: 5, fillColor: UIColor.clear.cgColor, lineCap: .round, strokeEnd: 1)
        shapeLayer = createShape(path: circularPath.cgPath, strokeColor: UIColor.green.cgColor, lineWidth: 5, fillColor: UIColor.clear.cgColor, lineCap: .round, strokeEnd: 1)
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
        
        // Touch into screen
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTab)))
    }
    
    func createShape(path: CGPath, strokeColor: CGColor, lineWidth: CGFloat, fillColor: CGColor, lineCap: CAShapeLayerLineCap, strokeEnd: CGFloat) -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = path
        
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.fillColor = fillColor
        shapeLayer.lineCap = lineCap
        shapeLayer.strokeEnd = strokeEnd
        
        return shapeLayer
    }
    
    @objc private func handleTab() {
        print("Animate Stroke")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.duration = 1 * 30 // 1s * 30
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "abcd")
    }
    
}
