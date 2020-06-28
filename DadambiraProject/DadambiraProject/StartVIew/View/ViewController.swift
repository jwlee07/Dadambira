//
//  ViewController.swift
//  DadambiraProject
//
//  Created by Qussk_MAC on 2020/06/24.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: -  Property
  
  var marqueeView: HorizontalMarqueeView!
  
  let timer = Timer()
  let timerArr : [IndexPath] = []
  let marqueeViewHeight: CGFloat = 7
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    marqueeView = HorizontalMarqueeView.init(frame: CGRect.init(
      x: UIScreen.main.bounds.size.width / 10,
      y: UIScreen.main.bounds.size.height / 2,
      width: UIScreen.main.bounds.size.width / 1.2,
      height: marqueeViewHeight))
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
  
  // MARK: - Setup Layout
  
  func setupLaunchImage(){
    let launchImage = UIImageView()
    let viewWidth = view.frame.width
    let viewHeight = view.frame.height
    launchImage.image = UIImage(named: "Dadam4")
    view.addSubview(launchImage)
    launchImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      launchImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      launchImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: viewWidth / 3),
      launchImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -(viewWidth / 3)),
      launchImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -(viewHeight / 2))
    ])
  }
  
  func navigationClear(){
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
}

// MARK: - StartViewControllerDelegate

extension ViewController: StartViewControllerDelegate {
  func handleDismiss() {
    let mainVC = MainViewController()
    let naviMainVC = UINavigationController(rootViewController: mainVC)
    naviMainVC.modalPresentationStyle = .fullScreen
    self.present(naviMainVC, animated: false)
  }
}


