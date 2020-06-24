//
//  TelepathyChoice.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/24.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TelepathyChoiceViewController: UIViewController {
  
  let telepathyChoiceTableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupNavigationBar()
  }
  func setupTableView() {
    view.addSubview(telepathyChoiceTableView)
    telepathyChoiceTableView.frame = view.frame
    telepathyChoiceTableView.rowHeight = 100
    telepathyChoiceTableView.delegate = self
    telepathyChoiceTableView.dataSource = self
    telepathyChoiceTableView.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 0.7)
    telepathyChoiceTableView.register(TelepathyChoiceCell.self, forCellReuseIdentifier: "ChoiceCustom")
  }
  
  func setupNavigationBar() {
    let leftDismissButton = UIBarButtonItem (image: UIImage(systemName: "arrowshape.turn.up.left.fill"), style: .plain, target: self, action: #selector(didTapDismissButton))
    leftDismissButton.tintColor = UIColor(red: 66/255, green: 72/255, blue: 166/255, alpha: 1.0)
    
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  @objc func didTapDismissButton(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
  }
}
extension TelepathyChoiceViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    userList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let telepathyChCell = telepathyChoiceTableView.dequeueReusableCell(withIdentifier: "ChoiceCustom", for: indexPath) as! TelepathyChoiceCell
    telepathyChCell.telepathyChoiceLabel.text = userList[indexPath.row]
    telepathyChCell.backgroundColor = UIColor(red: 166/255, green: 177/255, blue: 225/255, alpha: 1)
    return telepathyChCell
  }
}

extension TelepathyChoiceViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let telepathyChCell = telepathyChoiceTableView.dequeueReusableCell(withIdentifier: "ChoiceCustom", for: indexPath) as! TelepathyChoiceCell
    telepathyChCell.telepathyChoiceLabel.alpha = 1
  }
}

