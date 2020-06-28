//
//  StartViewController.swift
//  DadambiraProject
//
//  Created by Qussk_MAC on 2020/06/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol StartViewControllerDelegate: class {
  func handleDismiss()
}

class StartViewController: UIViewController {
  
  // MARK: - Property
  
  weak var delegate: StartViewControllerDelegate?
  
  let topView = UIView()
  let tableView = UITableView()
  let topTitle = UILabel()
  let cancelButton = UIButton()
  var ani = false
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupTableView()
    
  }
  
  // MARK: - Setup Layout
  
  func setupView(){
    view.backgroundColor = .darkGray
    view.addSubview(topView)
    topView.alpha = 0.5
    
    topTitle.textColor = .white
    topTitle.textAlignment = .center
    topTitle.font = UIFont.boldSystemFont(ofSize: 25)
    topTitle.text = "게임설명"
    topTitle.contentMode = .center
    view.addSubview(topTitle)
    
    cancelButton.addTarget(self, action: #selector(setupButton), for: .touchUpInside)
  }
  
  @objc func setupButton(_ sender: UIButton){
    dismiss(animated: false, completion: {
      self.delegate?.handleDismiss()
    })
    
  }
  
  func setupTableView() {
    
    let viewWidth = view.frame.width
    let viewHeight = view.frame.height
    let margin: CGFloat = 10
    let topTitleMargin: CGFloat = 20
    
    //  TableVIew
    tableView.backgroundColor = .black
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = viewHeight / 5
    tableView.separatorStyle = .singleLine
    tableView.separatorColor = .darkGray
    tableView.separatorEffect = .none
    tableView.backgroundColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1)
    
    tableView.register(StartTableViewCell.self, forCellReuseIdentifier: "TableCell")
    
    
    
    cancelButton.setImage(UIImage(systemName: "multiply"), for: .normal)
    cancelButton.setPreferredSymbolConfiguration(.init(scale: .large), forImageIn: .normal)
    cancelButton.tintColor = .white
    cancelButton.backgroundColor = .clear
    
    
    
    // Layout
    
    [topView,tableView,cancelButton,topTitle].forEach {
      view.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: viewHeight / 9),
      tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
    
      topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      topView.bottomAnchor.constraint(equalTo: tableView.safeAreaLayoutGuide.topAnchor),
      
      topTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topTitleMargin),
      topTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: viewWidth / 3),
      topTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -viewWidth / 3),
      
      cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
      cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: viewWidth / 1.2),
      cancelButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -margin),
    ])
  }
}



//MARK:- StartViewController

extension StartViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    images.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! StartTableViewCell
    cell.backgroundColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1)
    return  cell
  }
}


extension StartViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let CustomCell = cell as? StartTableViewCell else { return }
    CustomCell.configure(image: UIImage(
      named: images[indexPath.row]), title: titleData[indexPath.row], lable: labelData[indexPath.row])
  }
}



