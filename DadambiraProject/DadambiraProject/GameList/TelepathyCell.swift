//
//  CustomCell.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyCell: UITableViewCell {
  
  // MARK: - ProPerty
  
  weak var delegate: TelepathyCellDelegate?
  
  let telepathCellLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: 30)
    label.textColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0)
    return label
  }()
  
  let telepathCellTextfield: UITextField = {
    let textfield = UITextField()
    textfield.placeholder = "입력"
    textfield.font = UIFont.boldSystemFont(ofSize: 30)
    textfield.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1)
    textfield.textColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0)
    textfield.textAlignment = .left
    textfield.clipsToBounds = true
    textfield.borderStyle = .none
    textfield.returnKeyType = .done
    textfield.keyboardType = .namePhonePad
    return textfield
  }()
  
  let leadingMargin: CGFloat = 75
  let minMargin: CGFloat = 30
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupContentViewLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
  }
  
  // MARK: -  setup Layout
  
  func setupContentViewLayout() {
    
    [telepathCellLabel, telepathCellTextfield].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview($0)
    }
    
    NSLayoutConstraint.activate([
      
      telepathCellLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: minMargin),
      telepathCellLabel.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: minMargin),
      telepathCellLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -contentView.frame.width),
      telepathCellLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -minMargin),
      
      telepathCellTextfield.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      telepathCellTextfield.leadingAnchor.constraint(equalTo: telepathCellLabel.safeAreaLayoutGuide.trailingAnchor),
      telepathCellTextfield.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
      telepathCellTextfield.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
    ])
    telepathCellTextfield.delegate = self
    
  }
}
  // MARK: - UITextFieldDelegate

extension TelepathyCell: UITextFieldDelegate {
  func textFieldDidEndEditing(_ textField: UITextField) {
    checkTextfieldKeyword.append(telepathCellTextfield.text!)
  }
  func textFieldDidChangeSelection(_ textField: UITextField) {
    guard let text = textField.text else { return }
    if text.count > 10 { textField.text?.removeLast() }
    delegate?.inputText(text, tag: textField.tag)
  }
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    return true
  }
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
    checkTextfieldKeyword.append(textField.text!)
  }
}

protocol TelepathyCellDelegate: class {
  func inputText(_ text: String, tag: Int)
}
