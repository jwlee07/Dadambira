//
//  TelepathyGame.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyGameViewController: UIViewController {
  
  let personNumberSetupButton: UIButton = {
    let button = UIButton()
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "텔레파시 으잉!"
    setupNavigationBar()
    
  }
  
  func setupNavigationBar() {
    let leftDismissButton = UIBarButtonItem (image: UIImage(systemName: "arrowshape.turn.up.left.fill"), style: .plain, target: self, action: #selector(didTapDismissButton))
    leftDismissButton.tintColor = UIColor(red: 66/255, green: 72/255, blue: 166/255, alpha: 1)
    
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  @objc func didTapDismissButton(_ sender: UIBarButtonItem) {
    
  }
  
}
