//
//  TelepathyGame.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyGameViewController: UIViewController {
  
  // MARK: - Property
  
  let telepathyTableView: UITableView = {
    let tableView = UITableView()
    tableView.rowHeight = 120
    tableView.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 0.7)
    return tableView
  }()
  
  let test = UIView()
  
  let marge: CGFloat = 50
  
  var toggle = false
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupNavigationBar()
    
  }
  
  // MARK: - setup Layout
  func setupTableView() {
    view.addSubview(telepathyTableView)
    telepathyTableView.delegate = self
    telepathyTableView.dataSource = self
    telepathyTableView.register(TelepathyCell.self, forCellReuseIdentifier: "TelepathyCustom")
    
    telepathyTableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      telepathyTableView.topAnchor.constraint(equalTo: view.topAnchor),
      telepathyTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      telepathyTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      telepathyTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
  func setupNavigationBar() {
    let leftDismissButton = UIBarButtonItem (image: UIImage(systemName: "arrowshape.turn.up.left.fill"), style: .plain, target: self, action: #selector(didTapDismissButton))
    let rightCompleteButton = UIBarButtonItem (image: UIImage(systemName: "checkmark"), style: .plain, target: self, action: #selector(didTapCompleteButton))
    
    rightCompleteButton.tintColor = UIColor(red: 66/255, green: 72/255, blue: 166/255, alpha: 1.0)
    leftDismissButton.tintColor = UIColor(red: 66/255, green: 72/255, blue: 166/255, alpha: 1.0)
    
    title = "제비뽑기"
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationItem.rightBarButtonItem = rightCompleteButton
    
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor()
  }
  @objc func didTapDismissButton() {
    navigationController?.popViewController(animated: true)
    self.telepathyTableView.reloadData()
  }
  
  @objc func didTapCompleteButton() {
    
    
  }
  
}
extension TelepathyGameViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Int(checkPersonNumberString)!
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let telepathyCell = telepathyTableView.dequeueReusableCell(withIdentifier: "TelepathyCustom", for: indexPath) as! TelepathyCell
    telepathyCell.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1)
    telepathyCell.imageView?.image = telepathCellImage[indexPath.row].withTintColor(UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1.0), renderingMode: .alwaysOriginal)
    telepathyCell.telepathCellTextfield.alpha = 1
    
    return telepathyCell
  }
}
extension TelepathyGameViewController: UITableViewDelegate {
  
}
