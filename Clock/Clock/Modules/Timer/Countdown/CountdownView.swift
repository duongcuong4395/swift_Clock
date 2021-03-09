//
//  TimerControlView.swift
//  Clock
//
//  Created by Duong Cuong on 2/2/21.
//  Copyright © 2021 Duong Cuong. All rights reserved.
//

import Foundation
import UIKit

class CountdownUIView : UIView {
    
    var shapeLayer = CAShapeLayer()
    
    let picker = UIPickerView()
    
    var hour: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    
    
    override init(frame: CGRect) {
      super.init(frame: frame)
       
        setupPickerView()
        picker.delegate = self
        picker.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    func setupPickerView() {
        self.addSubview(picker)
        
        //self.picker.addSubview(hourLabel)
        
        self.picker.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        let hourLabel = UILabel(frame: CGRect(x: 42, y: self.picker.frame.size.height / 2 - 15, width: 75, height: 30))
        hourLabel.text = " Hour";
        self.picker.addSubview(hourLabel)
        
        let minsLabel = UILabel(frame: CGRect(x: 50 + (self.picker.frame.size.width / 3), y: self.picker.frame.size.height / 2 - 15, width: 75, height: 30))
        minsLabel.text = " Min";
        self.picker.addSubview(minsLabel)
        
        let secsLabel = UILabel(frame: CGRect(x: 50 + ((self.picker.frame.size.width / 3) * 2), y: self.picker.frame.size.height / 2 - 15, width: 75, height: 30))
        secsLabel.text = " Sec";
        self.picker.addSubview(secsLabel)
    }
    
    func setup_CountdownView() {
        self.backgroundColor = .white
        // center view
        let center = self.center
        let radius = self.frame.width > self.frame.height ? self.frame.height : self.frame.width
        // radius = 200
        let circularPath = UIBezierPath(arcCenter: center, radius: radius - 5, startAngle: -CGFloat.pi / 2, endAngle: 3 * CGFloat.pi / 2, clockwise: true)
        // Create track layer
        var trackLayer = CAShapeLayer()
        trackLayer = createShape(path: circularPath.cgPath, strokeColor: UIColor.lightGray.cgColor, lineWidth: 5, fillColor: UIColor.clear.cgColor, lineCap: .round, strokeEnd: 1)
        shapeLayer = createShape(path: circularPath.cgPath, strokeColor: UIColor.green.cgColor, lineWidth: 5, fillColor: UIColor.clear.cgColor, lineCap: .round, strokeEnd: 1)
        self.layer.addSublayer(trackLayer)
        self.layer.addSublayer(shapeLayer)
        
        // Touch into screen
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTab)))
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



extension TimerControlUIView: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? 24 : 60
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break;
        }
        
        print("Time: ", hour, minutes, seconds)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let columnView = UILabel(frame: CGRect(x: 35, y: 0, width: self.picker.frame.size.width/3 - 35, height: 30))
        columnView.text = String(format: "%lu", row)
        columnView.textAlignment = .left;
        
        print(row)
        return columnView;
        
    }
    
}
