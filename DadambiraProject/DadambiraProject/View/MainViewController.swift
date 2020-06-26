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
    setupCollectionView()
    
  }
  
  func navigationClear(){
    
    title = "다댐비라"
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.backgroundColor = UIColor.clear
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 66/255, green: 72/255, blue: 116/255)]
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "CreCjaL", size: 40)!]
  }
  
  
  func setupCollectionView() {
    
    layour.itemSize = CGSize(width: 176 , height: 300)
    layour.minimumLineSpacing = 16
    layour.minimumInteritemSpacing = 8
    layour.sectionInset = UIEdgeInsets(top: 26, left: 20, bottom: 30, right: 20)
    
    
    //컬렉션뷰
    super.view.backgroundColor = UIColor(red: 244/255, green: 238/255, blue: 255/255, alpha: 1)
    collectionView.backgroundColor = .clear
    collectionView.dataSource = self
    collectionView.delegate = self
    view.addSubview(collectionView)
    
    collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
    

    //레이아웃
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:  20).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
  }
  
  
}


// MARK: UICollectionViewDataSource

extension MainViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! MainCollectionViewCell
    
    if !cell.isAnimated {
      
      UIView.animate(withDuration: 0.5, delay: 0.5 * Double(indexPath.row), usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: indexPath.row % 2 == 0 ? .transitionFlipFromLeft : .transitionFlipFromRight, animations: {
        
        if indexPath.row % 2 == 0 {
          AnimationUtility.viewSlideInFromLeft(toRight: cell)
        }
        else {
          AnimationUtility.viewSlideInFromRight(toLeft: cell)
        }
        
      }, completion: { (done) in
        cell.isAnimated = true
      })
    }
    
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
  }
  
}



//MARK: -UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath.item)
    
    selectIndexPathArray.append(indexPath)

    switch titleData[indexPath.item] {
    case "텔레파시" :
      let vc = HitAndMissGameViewController()
      //let nv = UINavigationController(rootViewController: vc)
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
      //present(vc, animated: true)
      
    case "복불복" :
      let vc = TelepathyInfoGameViewController()
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
      
      
    case "받아라 폭탄" :
      let vc = TimeBombViewController()
      vc.modalPresentationStyle = .fullScreen
      navigationController?.pushViewController(vc, animated: true)
        
    case "낚시게임" :
        let fishVC = LetsFishingViewController()
        fishVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(fishVC, animated: true)
    default:
      print("잘못된 접근")
    }
    
  }
}
