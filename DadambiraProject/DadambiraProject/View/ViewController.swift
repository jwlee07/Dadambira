//
//  ViewController.swift
//  DadambiraProject
//
//  Created by Qussk_MAC on 2020/06/24.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var marqueeView: HorizontalMarqueeView!
  
  let timer = Timer()
  let timerArr : [IndexPath] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    
    marqueeView = HorizontalMarqueeView.init(frame: CGRect.init(x: UIScreen.main.bounds.size.width/10, y: 370, width: UIScreen.main.bounds.size.width/1.2, height: 5))
    self.view.addSubview(marqueeView)
    
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//      let vc = MainViewController()
//      vc.modalPresentationStyle = .fullScreen
//      self.present(vc, animated: true)
//    }
    
    marqueeView.initBar()
    seelpCount()
  }
  
  
  func seelpCount(){
    
    //  dismiss(animated: true)
    //    UIView.animate(withDuration: <#T##TimeInterval#>,
    //                   delay: <#T##TimeInterval#>,
    //                   options: <#T##UIView.AnimationOptions#>,
    //                   animations: <#T##() -> Void#>,
    //                   completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
  }
  
  
  
}



