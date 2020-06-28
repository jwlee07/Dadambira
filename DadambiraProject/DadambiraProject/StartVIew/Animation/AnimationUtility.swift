//
//  AnimationUtility.swift
//  DadambiraProject
//
//  Created by Qussk_MAC on 2020/06/26.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class AnimationUtility: UIViewController, CAAnimationDelegate {
  
  static let kSlideAnimationDuration: CFTimeInterval = 0.5
  
  static func viewSlideInFromRight(toLeft views: UIView) {
    var transition: CATransition? = nil
    transition = CATransition.init()
    transition?.duration = kSlideAnimationDuration
    transition?.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition?.type = CATransitionType.push
    transition?.subtype = CATransitionSubtype.fromRight
    //transition?.delegate = (self as! CAAnimationDelegate)
    views.layer.add(transition!, forKey: nil)
  }
  
  static func viewSlideInFromLeft(toRight views: UIView) {
    var transition: CATransition? = nil
    transition = CATransition.init()
    transition?.duration = kSlideAnimationDuration
    transition?.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition?.type = CATransitionType.push
    transition?.subtype = CATransitionSubtype.fromLeft
 //   transition?.delegate = (self as! CAAnimationDelegate)
    views.layer.add(transition!, forKey: nil)
  }
  
  static func viewSlideInFromTop(toBottom views: UIView) {
    var transition: CATransition? = nil
    transition = CATransition.init()
    transition?.duration = kSlideAnimationDuration
    transition?.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition?.type = CATransitionType.push
    transition?.subtype = CATransitionSubtype.fromBottom
//transition?.delegate = (self as! CAAnimationDelegate)
    views.layer.add(transition!, forKey: nil)
  }
  
  static func viewSlideInFromBottom(toTop views: UIView) {
    var transition: CATransition? = nil
    transition = CATransition.init()
    transition?.duration = kSlideAnimationDuration
    transition?.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    transition?.type = CATransitionType.push
    transition?.subtype = CATransitionSubtype.fromTop
  //  transition?.delegate = (self as! CAAnimationDelegate)
    views.layer.add(transition!, forKey: nil)
  }
}
