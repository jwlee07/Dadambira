//
//  TelepathyGame.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyGameViewController: UIViewController, UITableViewDelegate {
  
  // MARK: - Property
  
  let telepathyTableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = 100
    tableView.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 0.7)
    return tableView
  }()
  
  let test = UIView()
  let marge: CGFloat = 50
  var toggle = false
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "복볼복"
    setupTableView()
    setupNavigationBar()
    setupData()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    view.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1)
  }
  
  // MARK: - setup Layout
  
  func setupData() {
    guard let count = Int(checkPersonNumberString) else { return }
    for _ in 1...count {
      textList.append("")
    }
  }
  
  func setupTableView() {
    
    view.addSubview(telepathyTableView)
    telepathyTableView.delegate = self
    telepathyTableView.dataSource = self
    telepathyTableView.register(TelepathyCell.self, forCellReuseIdentifier: "TelepathyCustom")
    
    telepathyTableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      telepathyTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      telepathyTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      telepathyTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      telepathyTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -view.frame.height / 3)
    ])
  }

  func setupNavigationBar() {
    let leftDismissButton = UIBarButtonItem (image: UIImage(systemName: "arrowshape.turn.up.left.fill"), style: .plain, target: self, action: #selector(didTapDismissButton))
    let rightPushButton = UIBarButtonItem (image: UIImage(systemName: "checkmark"), style: .plain, target: self, action: #selector(didTapPushButton))
    leftDismissButton.tintColor = UIColor(red: 66/255, green: 72/255, blue: 166/255, alpha: 1.0)
    rightPushButton.tintColor = UIColor(red: 66/255, green: 72/255, blue: 166/255, alpha: 1.0)
    
    
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationItem.rightBarButtonItem = rightPushButton
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  // MARK: - Action Button
  
  @objc func didTapDismissButton() {
    navigationController?.popViewController(animated: true)
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.telepathyTableView.reloadData()
      textList.removeAll()
    }
  }
  
  @objc func didTapPushButton() {
    if !(textList.contains("")) {
      let TelepathyChoiceVC = TelepathyChoiceViewController()
      TelepathyChoiceVC.view.backgroundColor = .systemBackground
      navigationController?.pushViewController(TelepathyChoiceVC, animated: true)
    } else {
      let checkTextAlert = UIAlertController (title: "잠깐만요 !", message: "모두 입력해주세요 !", preferredStyle: .alert)
      let checkTextAlertOk = UIAlertAction (title: "넵 !", style: .default)
      checkTextAlert.addAction(checkTextAlertOk)
      present(checkTextAlert, animated: true)
    }
  }
}

// MARK: - UITableViewDataSource
extension TelepathyGameViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return textList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let telepathyCell = telepathyTableView.dequeueReusableCell(withIdentifier: "TelepathyCustom", for: indexPath) as! TelepathyCell
    telepathyCell.delegate = self
    telepathyCell.telepathCellTextfield.tag = indexPath.row
    telepathyCell.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1)
    telepathyCell.telepathCellLabel.text = "\(indexPath.row + 1)"
    telepathyCell.telepathCellTextfield.text = textList[indexPath.row]
    if indexPath.row == 0 {
      telepathyCell.telepathCellTextfield.keyboardType = .webSearch
      telepathyCell.telepathCellTextfield.becomeFirstResponder()
    }
    return telepathyCell
  }
}

// MARK: - TelepathyCellDelegate
extension TelepathyGameViewController: TelepathyCellDelegate {
  func inputText(_ text: String, tag: Int) {
    textList[tag] = text
  }
}
