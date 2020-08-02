//
//  PickerView.swift
//  DadambiraProject
//
//  Created by 김동현 on 2020/06/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PickerView: UIPickerView {
  
  // MARK: Properties
  private let values: [String] = ["30","60","90","120","150","180","210","240","270","300","330", "360"]
  
  private var choiceValue = ""
  
  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
    ConfigureViewComponents()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  // MARK: Configure
  func configure() {
    delegate = self
    dataSource = self
    setValue(UIColor.white, forKey: "textColor")
  }
  
  
  // MARK: Configure View Components
  func ConfigureViewComponents() {
    backgroundColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1)
    layer.cornerRadius = 10
    tintColor = .white
  }
  
  // MARK: @Objc
  
}

// MARK: Extension
extension PickerView: UIPickerViewDelegate {
  // 컴포넌트의 목록 각 행에 출력될 내용
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return values[row]
  }
  
  // 컴포넌트의 행을 선택했을 때 실행할 액션
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    choiceValue = values[row]
    
    guard let TimeBombInfoVC = self.parentViewController as? TimeBombInfoViewController else { return }
    TimeBombInfoVC.timeInfoLabel.text = choiceValue
    return
  }
  
}

extension PickerView: UIPickerViewDataSource {
  // 생성할 컴포넌트의 개수 정의
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  // 컴포넌트가 가질 목록의 길이
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return values.count
  }
}
