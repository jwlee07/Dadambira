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
    
    
    marqueeView = HorizontalMarqueeView.init(frame: CGRect.init(x: UIScreen.main.bounds.size.width/10, y: 400, width: UIScreen.main.bounds.size.width/1.2, height: 5))
    self.view.addSubview(marqueeView)


   DispatchQueue.main.asyncAfter(deadline: .now() + 3) {

        let startVC = StartViewController()
    startVC.delegate = self
        startVC.modalPresentationStyle = .fullScreen
        self.present(startVC, animated: true)

   }
    marqueeView.initBar()
    setupLaunchImage()
    navigationClear()
  
  }
  func setupLaunchImage(){
    
    let launchImage = UIImageView()
    launchImage.image = UIImage(named: "Dadam4")
    
    view.addSubview(launchImage)
    
    launchImage.translatesAutoresizingMaskIntoConstraints = false
    
    launchImage.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width/2.8).isActive = true
    launchImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width/3).isActive = true
    launchImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.width/3)).isActive = true
    launchImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.width/0.7)).isActive = true

  }
  
  func navigationClear(){
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  
}

}

extension ViewController: StartViewControllerDelegate {
  func handleDismiss() {
    let MainVC = MainViewController()
    let navi = UINavigationController(rootViewController: MainVC)
    navi.modalPresentationStyle = .fullScreen
    self.present(navi, animated: false)
  }
  
}


