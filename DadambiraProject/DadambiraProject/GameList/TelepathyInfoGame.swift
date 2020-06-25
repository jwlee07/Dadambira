//
//  TelepathyGame.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyInfoGameViewController: UIViewController {
  
  // MARK: - Property
  
  let personNumberInfoLabel: UILabel = {
    let label = UILabel()
    label.text = "몇명에서 할꺼에요 ?"
    label.font = UIFont.boldSystemFont(ofSize: 35)
    label.textColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0)
    label.textAlignment = .center
    return label
  }()
  
  let personNumberTextfield: UITextField = {
    let textfield = UITextField()
    textfield.font = UIFont.boldSystemFont(ofSize: 25)
    textfield.layer.cornerRadius = 30
    textfield.textAlignment = .center
    textfield.clipsToBounds = true
    textfield.textColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0)
    textfield.borderStyle = .roundedRect
    textfield.keyboardType = .numberPad
    return textfield
  }()
  
  let personNumberInfoTextfieldLabel: UILabel = {
    let label = UILabel()
    label.text = "명"
    label.font = UIFont.boldSystemFont(ofSize: 35)
    label.textColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0)
    label.textAlignment = .center
    return label
  }()
  
  let personNumberInfoSetupButton: UIButton = {
    let button = UIButton()
    button.setTitle("선택완료", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
    button.layer.cornerRadius = 15
    button.clipsToBounds = true
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0)
    button.addTarget(self, action: #selector(didTapInfoButton), for: .touchUpInside)
    return button
  }()
  
  let margin: CGFloat = 50
  let height: CGFloat = 100
  let buttonMargin: CGFloat = 75
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "제비뽑기"
    setupViewLayout()
    setupNavigationBar()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    personNumberTextfield.becomeFirstResponder()
    
  }
  // MARK: - Setup Layout
  
  func setupViewLayout() {
    view.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1.0)
    
    view.addSubview(personNumberInfoLabel)
    view.addSubview(personNumberTextfield)
    view.addSubview(personNumberInfoTextfieldLabel)
    view.addSubview(personNumberInfoSetupButton)
    
    personNumberInfoLabel.translatesAutoresizingMaskIntoConstraints = false
    personNumberTextfield.translatesAutoresizingMaskIntoConstraints = false
    personNumberInfoTextfieldLabel.translatesAutoresizingMaskIntoConstraints = false
    personNumberInfoSetupButton.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      personNumberInfoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
      personNumberInfoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin),
      personNumberInfoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
      personNumberInfoLabel.heightAnchor.constraint(equalToConstant: height)
    ])
    
    NSLayoutConstraint.activate([
      personNumberTextfield.topAnchor.constraint(equalTo: personNumberInfoLabel.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      personNumberTextfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin),
      personNumberTextfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -(margin * 3)),
      personNumberTextfield.heightAnchor.constraint(equalToConstant: height)
    ])
    personNumberTextfield.delegate = self
    
    NSLayoutConstraint.activate([
      personNumberInfoTextfieldLabel.topAnchor.constraint(equalTo: personNumberInfoLabel.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      personNumberInfoTextfieldLabel.leadingAnchor.constraint(equalTo: personNumberTextfield.safeAreaLayoutGuide.trailingAnchor),
      personNumberInfoTextfieldLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
      personNumberInfoTextfieldLabel.heightAnchor.constraint(equalToConstant: height)
    ])
    
    NSLayoutConstraint.activate([
      personNumberInfoSetupButton.topAnchor.constraint(equalTo: personNumberTextfield.safeAreaLayoutGuide.bottomAnchor, constant: margin),
      personNumberInfoSetupButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: buttonMargin * 2),
      personNumberInfoSetupButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -buttonMargin * 2),
      personNumberInfoSetupButton.heightAnchor.constraint(equalToConstant: buttonMargin)
    ])
  }
  func setupNavigationBar() {
    let leftDismissButton = UIBarButtonItem (image: UIImage(systemName: "arrowshape.turn.up.left.fill"), style: .plain, target: self, action: #selector(didTapDismissButton))
    leftDismissButton.tintColor = UIColor(red: 66/255, green: 72/255, blue: 166/255, alpha: 1.0)
    
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  // MARK: - Action
  
  @objc func didTapDismissButton(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func didTapInfoButton(_ sender: UIButton) {
    if checkPersonNumberString != "" {
      let telepathyGameVC = TelepathyGameViewController()
      telepathyGameVC.view.backgroundColor = .systemBackground
//      telepathyGameVC.view.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 0.7)
      navigationController?.pushViewController(telepathyGameVC, animated: true)
    } else {
      let numberCheckError = UIAlertController (title: "잠깐만요 !", message: "숫자를 입력해주세용", preferredStyle: .alert)
      let numberCheckErrorOk = UIAlertAction (title: "넵 !", style: .default)
      numberCheckError.addAction(numberCheckErrorOk)
      present(numberCheckError, animated: true)
    }
  }
}
// MARK: - UITextFieldDelegate

extension TelepathyInfoGameViewController: UITextFieldDelegate {
  func textFieldDidChangeSelection(_ textField: UITextField) {
    checkPersonNumberString = personNumberTextfield.text!
  }
}
