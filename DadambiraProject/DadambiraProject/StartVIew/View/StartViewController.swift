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
  
  weak var delegate: StartViewControllerDelegate?
  
  let topView = UIView()
  let tableView = UITableView()
  let topTitle = UILabel()
  let cancelButton = UIButton()
  var ani = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    setupTableView()
    
  }
  
  func setupView(){
    view.backgroundColor = .darkGray
    
    topView.backgroundColor = .black
    topView.alpha = 0.5
    view.addSubview(topView)
    
    
    topTitle.textColor = UIColor(red: 220/255, green: 214/255, blue: 247/255, alpha: 0.8)
    topTitle.font = UIFont.boldSystemFont(ofSize: 20)
    topTitle.text = "게임설명"
    topTitle.contentMode = .center
    view.addSubview(topTitle)
    
    cancelButton.addTarget(self, action: #selector(setupButton(_:)), for: .touchUpInside)
    
  }
  
  @objc func setupButton(_ sender: UIButton){
    dismiss(animated: false, completion: {
      
      self.delegate?.handleDismiss()
    })

  }
  
  func setupTableView() {
    //테이블뷰
    tableView.backgroundColor = .black
    tableView.dataSource = self
    tableView.delegate = self
    tableView.rowHeight = 140
    tableView.separatorStyle = .singleLine
    tableView.separatorColor = .darkGray
    tableView.separatorEffect = .none
    
    tableView.register(StartTableViewCell.self, forCellReuseIdentifier: "TableCell")
    view.addSubview(tableView)
    
    
    cancelButton.setImage(UIImage(systemName: "multiply"), for: .normal)
    cancelButton.setPreferredSymbolConfiguration(.init(scale: .large), forImageIn: .normal)
    cancelButton.tintColor = .systemGray
    cancelButton.backgroundColor = .clear
    view.addSubview(cancelButton)
    
    
    //레이아웃
    [topView,tableView,cancelButton,topTitle].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    topTitle.topAnchor.constraint(equalTo: topView.topAnchor, constant: 30).isActive = true
    topTitle.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 150).isActive = true
    topTitle.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -40).isActive = true
    topTitle.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
    
    topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    topView.bottomAnchor.constraint(equalTo: tableView.topAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    
    cancelButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10).isActive = true
    cancelButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 320).isActive = true
    cancelButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30).isActive = true
    cancelButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
    
  }


}



//MARK:- StartViewController
extension StartViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    images.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! StartTableViewCell
    cell.backgroundColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 0.5)
    
    return  cell
  }
}


extension StartViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard let CustomCell = cell as? StartTableViewCell else { return }
    
    //이미지
    CustomCell.gameImage.frame = CGRect(
      x: 12, y: 10, width: 120, height: 120)
    CustomCell.gameImage.layer.cornerRadius = 15
    CustomCell.contentMode = .scaleAspectFill
    
    //게임레이블
    CustomCell.gameLable.frame = CGRect(
      x: cell.frame.width/2.8, y: 40,
      width: cell.frame.width/1.8, height: cell.frame.height/1.5)
    CustomCell.gameLable.lineBreakMode = .byClipping
    CustomCell.gameLable.numberOfLines = 5
    CustomCell.gameLable.textColor = UIColor(red: 220/255, green: 214/255, blue: 247/255, alpha: 0.8)
    CustomCell.gameLable.font = UIFont.systemFont(ofSize: 15, weight: .light)
    CustomCell.gameLable.backgroundColor = .clear
    
    
    //게임제목
    CustomCell.gameTitle.frame = CGRect(x: cell.frame.width/2.8, y: 10, width: cell.frame.width/1.8, height: cell.frame.height/4.5)
    CustomCell.gameTitle.textColor = UIColor(red: 220/255, green: 214/255, blue: 247/255, alpha: 1)
    CustomCell.gameTitle.font = UIFont.boldSystemFont(ofSize: 17)
    CustomCell.gameTitle.backgroundColor = .clear
    
    
    
    CustomCell.configure(image: UIImage(named: images[indexPath.row]), title: titleData[indexPath.row], lable: labelData[indexPath.row])
  }
  
}



