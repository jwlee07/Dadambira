//
//  TimeBombInfoViewController.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/07/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TimeBombInfoViewController: UIViewController {
  
  // MARK: - Property
  
  let timeInfoLabel: UILabel = {
    let label = UILabel()
    label.text = "30"
    label.textColor = .white
    label.textAlignment = .right
    label.font = UIFont.boldSystemFont(ofSize: 100)
    return label
  }()
  
  let timeStringLabel: UILabel = {
    let label = UILabel()
    label.text = "초"
    label.textColor = .white
    label.textAlignment = .left
    label.font = UIFont.boldSystemFont(ofSize: 50)
    return label
  }()
  
  let timeChoiceButton: UIButton = {
    let button = UIButton()
    button.setTitle("시간설정", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    button.addTarget(self, action: #selector(actionChoiceButton), for: .touchUpInside)
    return button
  }()
  
  let gameStartButton: UIButton = {
    let button = UIButton()
    button.setTitle("게임시작", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    button.addTarget(self, action: #selector(actionStartButton), for: .touchUpInside)
    return button
  }()
  
  let pickerViewCloseButton: UIButton = {
    let button = UIButton()
    button.setTitle("설정완료", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
    button.addTarget(self, action: #selector(actionCloseButton), for: .touchUpInside)
    return button
  }()
  
  private var pickerView: PickerView = {
    let pickerView = PickerView()
    return pickerView
  }()
  
  var pickerCheck = false
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setupNavigationBar()
    
  }
  
  // MARK: - Setup Layout
  
  func setUI() {
    title = "받아라 폭탄"
    view.backgroundColor = UIColor(red: 158/255, green: 169/255, blue: 240/255, alpha: 1)
    
    let viewWidth = view.frame.width
    let viewHeight = view.frame.height
    let viewGuide = view.safeAreaLayoutGuide
    let margin: CGFloat = 10
    let choicePadding: CGFloat = 100
    let startPadding: CGFloat = 175
    
    [timeInfoLabel, timeStringLabel,timeChoiceButton, gameStartButton].forEach{
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      timeInfoLabel.topAnchor.constraint(equalTo: viewGuide.topAnchor, constant: margin),
      timeInfoLabel.leadingAnchor.constraint(equalTo: viewGuide.leadingAnchor),
      timeInfoLabel.trailingAnchor.constraint(equalTo: viewGuide.trailingAnchor, constant: -viewWidth / 3),
      timeInfoLabel.bottomAnchor.constraint(equalTo: viewGuide.bottomAnchor, constant: -viewHeight / 1.5),
      
      timeStringLabel.topAnchor.constraint(equalTo: viewGuide.topAnchor, constant: margin),
      timeStringLabel.leadingAnchor.constraint(equalTo: timeInfoLabel.safeAreaLayoutGuide.trailingAnchor),
      timeStringLabel.bottomAnchor.constraint(equalTo: viewGuide.bottomAnchor, constant: -viewHeight / 1.5),
      
      timeChoiceButton.topAnchor.constraint(equalTo: timeInfoLabel.safeAreaLayoutGuide.bottomAnchor, constant: choicePadding),
      timeChoiceButton.leadingAnchor.constraint(equalTo: viewGuide.leadingAnchor, constant: viewWidth / 4),
      timeChoiceButton.trailingAnchor.constraint(equalTo: viewGuide.trailingAnchor, constant: -viewWidth / 4),
      timeChoiceButton.bottomAnchor.constraint(equalTo: viewGuide.bottomAnchor, constant: -viewHeight / 2),
      
      gameStartButton.topAnchor.constraint(equalTo: timeInfoLabel.safeAreaLayoutGuide.bottomAnchor, constant: startPadding),
      gameStartButton.leadingAnchor.constraint(equalTo: viewGuide.leadingAnchor, constant: viewWidth / 4),
      gameStartButton.trailingAnchor.constraint(equalTo: viewGuide.trailingAnchor, constant: -viewWidth / 4)
    ])
  }
  
  func setupNavigationBar() {
    let leftDismissButton = UIBarButtonItem (image: UIImage(systemName: "arrowshape.turn.up.left.fill"), style: .plain, target: self, action: #selector(didTapDismissButton))
    
    leftDismissButton.tintColor = UIColor(red: 66/255, green: 72/255, blue: 166/255, alpha: 1)
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  func setupPickView() {
    
    let viewGuide = view.safeAreaLayoutGuide
    let viewWidth = view.frame.width
    let viewHeight = view.frame.height
    let padding: CGFloat = 50
    
    [pickerView, pickerViewCloseButton].forEach{
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
      $0.alpha = 1
    }
    NSLayoutConstraint.activate([
      pickerView.topAnchor.constraint(equalTo: viewGuide.topAnchor, constant: viewHeight / 3.5),
      pickerView.leadingAnchor.constraint(equalTo: viewGuide.leadingAnchor, constant: viewWidth / 4),
      pickerView.trailingAnchor.constraint(equalTo: viewGuide.trailingAnchor, constant: -viewWidth / 4),
      pickerView.bottomAnchor.constraint(equalTo: viewGuide.bottomAnchor, constant: -viewHeight / 3),
      
      pickerViewCloseButton.topAnchor.constraint(equalTo: pickerView.safeAreaLayoutGuide.bottomAnchor, constant: padding),
      pickerViewCloseButton.leadingAnchor.constraint(equalTo: viewGuide.leadingAnchor, constant: viewWidth / 4),
      pickerViewCloseButton.trailingAnchor.constraint(equalTo: viewGuide.trailingAnchor, constant: -viewWidth / 4)
    ])
  }
  
  
  
  // MARK: - Action
  
  @objc func didTapDismissButton() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc private func actionChoiceButton(_ sender: UIButton) {
    setupPickView()
  }
  @objc private func actionCloseButton(_ sender: UIButton) {
    [pickerView, pickerViewCloseButton].forEach{
      $0.alpha = 0
    }
  }
  @objc private func actionStartButton (_ sender: UIButton) {
    let timeBombVC = TimeBombViewController()
    timeBombVC.choiceTime.text = timeInfoLabel.text
    navigationController?.pushViewController(timeBombVC, animated: true)
  }
}
// MARK: - Extemsion

extension UIView {
  var parentViewController: UIViewController? {
    var responder: UIResponder? = self
    while let nextResponder = responder?.next {
      responder = nextResponder
      if let vc = nextResponder as? UIViewController {
        return vc
      }
    }
    return nil
  }
}
