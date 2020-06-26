//
//  LaunchAnimation.swift
//  DadambiraProject
//
//  Created by Qussk_MAC on 2020/06/24.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class HorizontalMarqueeView: UIView {
  
  
  var barView: UIView!
  var backgroundGradientLayer: CAGradientLayer!
  
  var grdientDelay: CFTimeInterval = 0.7
  var grdientDuration: CFTimeInterval = 0.3
  var moveDelay: TimeInterval = 0.3
  var moveDuration: TimeInterval = 1
  
  public func initBar() {
    self.clipsToBounds = true
    self.backgroundColor = UIColor.clear
    
    let barW = self.frame.size.width / 2;
    let barH = self.frame.size.height;
    
    barView = UIView.init(frame: CGRect.init(x: self.frame.size.width, y: 0, width: barW, height: barH))
    barView.backgroundColor = UIColor.clear
    self.addSubview(barView)
    
    backgroundGradientLayer = CAGradientLayer()
    backgroundGradientLayer.frame = barView.bounds
    backgroundGradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.5)
    backgroundGradientLayer.endPoint = CGPoint.init(x: 1.0, y: 0.5)
    //166, 177, 225
    backgroundGradientLayer.colors = [UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1).cgColor, UIColor.clear.cgColor]
    backgroundGradientLayer.locations = [1.0, 1.0]
    barView.layer.addSublayer(backgroundGradientLayer)
    
    moveBarToLeft()
    
  }
  
  private func moveBarToLeft() {
    // reset
    barView.frame = CGRect.init(x: self.frame.size.width, y: 0, width: barView.frame.size.width, height: barView.frame.size.height)
    backgroundGradientLayer.colors = [UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1).cgColor, UIColor.clear.cgColor]
    backgroundGradientLayer.locations = [1.0, 1.0]
    
    
    // anim gradient
    let gradientChangeLocation = CABasicAnimation(keyPath: "locations")
    gradientChangeLocation.beginTime = CACurrentMediaTime() + grdientDelay
    gradientChangeLocation.duration = grdientDuration
    gradientChangeLocation.toValue = [-1.0, 1.0]
    gradientChangeLocation.fillMode = CAMediaTimingFillMode.forwards
    gradientChangeLocation.isRemovedOnCompletion = false
    
    self.backgroundGradientLayer.add(gradientChangeLocation, forKey: "locationsChange")
    
    // anim move
    UIView.animate(withDuration: moveDuration, delay: moveDelay, options: UIView.AnimationOptions.curveLinear, animations: {
      
      self.barView.frame = CGRect.init(x: -self.barView.frame.size.width, y: 0, width: self.barView.frame.size.width, height: self.barView.frame.size.height)
      
    }) { (isFinish) in
      
      self.moveBarToLeft()
      
    }
    
  }
  
  
}


