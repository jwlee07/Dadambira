//
//  ViewController.swift
//  DadambiraProject
//
//  Created by 이진욱 on 2020/06/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  let identifire = "MainViewController"
  let cellBehind = UILabel()
  var push = true
  var selectIndexPathArray: IndexPath = []
  
  let layout: UICollectionViewFlowLayout = {
    let t = UICollectionViewFlowLayout()
    t.itemSize = CGSize(width: 164 , height: 300)
    t.minimumLineSpacing = 16
    t.minimumInteritemSpacing = 0
    t.sectionInset = UIEdgeInsets(top: 26, left: 16, bottom: 30, right: 16)
    return t
  }()
  
  lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layour)
  let layour = UICollectionViewFlowLayout()
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationClear()
    setupLongPressDestureRecignizer()
    setupCollectionView()
    
    let viewVC = ViewController()
    viewVC.modalPresentationStyle = .fullScreen
    present(viewVC, animated: false)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      viewVC.dismiss(animated: false) {
        let startVC = StartViewController()
        startVC.modalPresentationStyle = .fullScreen
        self.present(startVC, animated: true)
      }
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  func navigationClear(){
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
  }
  
  //Start화면 한번만 띄우기
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    
    if push == true {
     // let vc = StartViewController()
      print(push)
     // vc.modalPresentationStyle = .fullScreen
     // present(vc, animated: true)
      push = false
    } else {
      print(push)
    }
    
  }
  
  func mainAnimation(){
    UIView.animateKeyframes(
      withDuration: 100,
      delay: 0,
      animations: {
        UIView.addKeyframe(withRelativeStartTime: 0.0,
                           relativeDuration: 0.25
        ){
          self.collectionView.alpha = 10
          // self.collectionView.center.x += 50.0
          //  self.collectionView.center.y += 20.0
        }
    }
    ){ _ in
    }
  }
  
  
  
  func setupCollectionView() {
    
    layour.itemSize = CGSize(width: 164 , height: 300)
    layour.minimumLineSpacing = 16
    layour.minimumInteritemSpacing = 0
    layour.sectionInset = UIEdgeInsets(top: 26, left: 16, bottom: 30, right: 16)
    
    
    //컬렉션뷰
    super.view.backgroundColor = UIColor(red: 244/255, green: 238/255, blue: 255/255, alpha: 1)
    collectionView.backgroundColor = .clear
    collectionView.dataSource = self
    collectionView.delegate = self
    view.addSubview(cellBehind)
    view.addSubview(collectionView)
    
    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
    
    //다댐비라 레이블
    let mainTitle = UILabel()
    mainTitle.backgroundColor = UIColor(red: 244/255, green: 238/255, blue: 255/255, alpha: 1)
    mainTitle.text = "다댐비라"
    mainTitle.textAlignment = .center
    mainTitle.textColor = UIColor(red: 66/255, green: 72/255, blue: 116/255, alpha: 1)
    mainTitle.shadowColor = .black
    mainTitle.font = UIFont(name: "CreCjaL", size: 40)
    view.addSubview(mainTitle)
    
    
    //셀 뒤 아이콘
    cellBehind.text = "👾"
    cellBehind.isHidden = true
    
    
    //레이아웃
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    mainTitle.translatesAutoresizingMaskIntoConstraints = false
    cellBehind.translatesAutoresizingMaskIntoConstraints = false
    
    cellBehind.topAnchor.constraint(equalTo: view.topAnchor, constant: 170).isActive = true
    cellBehind.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90).isActive = true
    cellBehind.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100).isActive = true
    cellBehind.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -525).isActive = true
    
    collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant:  80).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
    
    mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
    mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    mainTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    mainTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -725).isActive = true
    
    
  }
  
  
  // MARK: Setup Gesture
  // 셀 제스처
  func setupLongPressDestureRecignizer(){
    let gesture = UILongPressGestureRecognizer(target: self, action: #selector(reorderCollectionViewItem(_:))
    )
    collectionView.addGestureRecognizer(gesture)
  }
  
  @objc private func reorderCollectionViewItem(_ sender: UILongPressGestureRecognizer) {
    print(sender)
    let location = sender.location(in: collectionView)
    guard let indexPath = collectionView.indexPathForItem(at: location) else { return }
    
    let cell =  collectionView.cellForItem(at: indexPath)!
    UIView.animate(withDuration: 0.5) {
      cell.alpha = 0
      self.cellBehind.isHidden = false
    }
    
    switch sender.state {
    case .began:
      guard let indexPath = collectionView.indexPathForItem(at: location) else { break }
      collectionView.beginInteractiveMovementForItem(at: indexPath)
    case .changed:
      collectionView.updateInteractiveMovementTargetPosition(location)
    case .cancelled:
      collectionView.cancelInteractiveMovement()
    case .ended:
      collectionView.endInteractiveMovement()
    default:
      break
    }
  }
}

// MARK: UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    cellBehind.isHidden = true
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! MainCollectionViewCell
    
    
    cell.backgroundColor = .clear
    cell.mainImageView.image = UIImage(named: images[indexPath.item])
    cell.mainTitleImage.image = UIImage(named: "cardShadow")
    cell.titlteLable.text = titleData[indexPath.item]
    
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    guard sourceIndexPath != destinationIndexPath else { return }
    let source = sourceIndexPath.item
    let destination = destinationIndexPath.item
    print("source: ", source, "dest: ", destination)
    cellBehind.isHidden = true
  }
  
}
//MARK: -UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath.item)
    cellBehind.isHidden = true
    
    selectIndexPathArray.append(indexPath)
    
    let cell = collectionView.cellForItem(at: indexPath) as! MainCollectionViewCell
    
    switch titleData[indexPath.item] {
    case "텔레파시" :
      let vc = HitAndMissGameViewController()
      //let nv = UINavigationController(rootViewController: vc)
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
      //present(vc, animated: true)
      
    case "제비뽑기" :
      let vc = TelepathyInfoGameViewController()
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
      
      
    case "폭탄던지기" :
      let vc = TimeBombViewController()
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
    default:
      print("잘못된 접근")
    }
    
    
  }
}


