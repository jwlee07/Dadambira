//
//  GoogleViewController.swift
//  DadambiraProject
//
//  Created by 김동현 on 2020/06/25.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

class GoogleViewController: UIViewController {
    
    // MARK: Properties
    var timer = Timer()
    
    var time: Int = 20
    
    let fishes = ["Fish1", "Fish2", "Fish3", "Fish4", "Trash", ""]
    
    let array = Array(0...5)
    
    var score: Int = 0
    
    var fish1CheckBool = false
    var fish2CheckBool = false
    var fish3CheckBool = false
    var fish4CheckBool = false
    var trashCheckBool = false
    
    var checkBool = false
    
    lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.text = "\(score)"
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "\(time)"
        return label
    }()
    
    let castingButton: UIButton = {
        let button = UIButton(type: .system)
        button.alpha = 0.5
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 15
        return button
    }()
    
    let secretButton: UIButton = {
        let button = UIButton()
        button.isEnabled = false
        button.addTarget(self, action: #selector(DidTapCastingButton), for: .touchUpInside)
        return button
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GoogleBG")
        return imageView
    }()
    
    let fishingRod: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "FishingRod")
        return imageView
    }()
    
    let gameStartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("게임 시작", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapGameStartButton), for: .touchUpInside)
        return button
    }()
    
    let reStartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("한번 더", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 50)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didTapReStartButton), for: .touchUpInside)
        button.alpha = 0
        return button
    }()
    
    let boat2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Boat2")
        return imageView
    }()
    
    let seagull: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Seagull")
        return imageView
    }()
    
    let fish1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Fish1")
        return imageView
    }()
    
    let fish2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Fish2")
        return imageView
    }()
    
    let fish3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Fish3")
        return imageView
    }()
    
    let fish4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Fish4")
        return imageView
    }()
    
    let trash: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Trash")
        return imageView
    }()
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureViewComponents()
        
    }
    
    // MARK: Helpers
    func castingButtonEffect() {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0.0, options: .repeat, animations: {
            let rotation = -0.999*CGFloat.pi
            self.castingButton.transform = CGAffineTransform(rotationAngle: rotation)
        }, completion: nil)
    }
    
    
    private func timeLimitStart() {
        // 타이머 생성 . interval = 시간 간격,
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeLimit), userInfo: nil, repeats: true)
    }
    
    private func timeLimitStop() {
        timer.invalidate()
    }
    
    private func vibrate() {
        // 핸드폰 설정에서 진동을 꺼둔 상황엔 동작하지 않음.
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        // 진동이 울리고 나서 할께 있으면 컴플리션에 넣어준다.
    }
    
    
    // MARK: Configure
    func configure() {
        title = "Shoreline Lake Park"
        
    }
    
    // MARK: Configure View Components
    func configureViewComponents() {
        view.backgroundColor = .systemBackground
        
        
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        view.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        timeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        
        view.addSubview(fishingRod)
        fishingRod.translatesAutoresizingMaskIntoConstraints = false
        //        fishingRod.bottomAnchor.constraint(equalTo: backgroundImageView.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        fishingRod.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -130).isActive = true
        fishingRod.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 130).isActive = true
        fishingRod.transform = CGAffineTransform(scaleX: 0.055, y: 0.055)
        fishingRod.transform = fishingRod.transform.rotated(by: CGFloat(Double.pi / 2)*7.40)
        
        view.addSubview(castingButton)
        castingButton.translatesAutoresizingMaskIntoConstraints = false
        castingButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        castingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        castingButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        castingButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        castingButtonEffect()
        
        view.addSubview(secretButton)
        secretButton.translatesAutoresizingMaskIntoConstraints = false
        secretButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        secretButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60).isActive = true
        secretButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        secretButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(seagull)
        seagull.translatesAutoresizingMaskIntoConstraints = false
        seagull.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        seagull.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        seagull.widthAnchor.constraint(equalToConstant: 60).isActive = true
        seagull.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        view.addSubview(boat2)
        boat2.translatesAutoresizingMaskIntoConstraints = false
        boat2.rightAnchor.constraint(equalTo: castingButton.leftAnchor, constant: 1).isActive = true
        boat2.bottomAnchor.constraint(equalTo: castingButton.topAnchor, constant: -180).isActive = true
        boat2.widthAnchor.constraint(equalToConstant: 120).isActive = true
        boat2.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(gameStartButton)
        gameStartButton.translatesAutoresizingMaskIntoConstraints = false
        gameStartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gameStartButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(reStartButton)
        reStartButton.translatesAutoresizingMaskIntoConstraints = false
        reStartButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reStartButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(fish1)
        view.addSubview(fish2)
        view.addSubview(fish3)
        view.addSubview(fish4)
        
        fish1.translatesAutoresizingMaskIntoConstraints = false
        fish2.translatesAutoresizingMaskIntoConstraints = false
        fish3.translatesAutoresizingMaskIntoConstraints = false
        fish4.translatesAutoresizingMaskIntoConstraints = false
        
        fish1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        fish1.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        fish1.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fish1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        fish1.alpha = 0
        
        fish2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 190).isActive = true
        fish2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 350).isActive = true
        fish2.widthAnchor.constraint(equalToConstant: 85).isActive = true
        fish2.heightAnchor.constraint(equalToConstant: 85).isActive = true
        fish2.alpha = 0
        
        fish3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        fish3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fish3.widthAnchor.constraint(equalToConstant: 70).isActive = true
        fish3.heightAnchor.constraint(equalToConstant: 70).isActive = true
        fish3.alpha = 0
        
        fish4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 230).isActive = true
        fish4.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 80).isActive = true
        fish4.widthAnchor.constraint(equalToConstant: 50).isActive = true
        fish4.heightAnchor.constraint(equalToConstant: 50).isActive = true
        fish4.alpha = 0
        
        view.addSubview(trash)
        trash.translatesAutoresizingMaskIntoConstraints = false
        trash.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 230).isActive = true
        trash.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 80).isActive = true
        trash.widthAnchor.constraint(equalToConstant: 50).isActive = true
        trash.heightAnchor.constraint(equalToConstant: 50).isActive = true
        trash.alpha = 0
        
    }
    
    // MARK: @Objc
    @objc func DidTapCastingButton() {
        
        let myIndex = array.randomElement()
        let choiceFish = fishes[myIndex!]
        
        if checkBool == false {
            self.checkBool = true
            UIView.animate(withDuration: 0.2, animations: {
                self.fishingRod.transform = self.fishingRod.transform.rotated(by: CGFloat(-3.14)*8.40)
            })
            UIView.animate(withDuration: 0.4, delay: 0.2, animations: {
                self.fishingRod.transform = self.fishingRod.transform.rotated(by: CGFloat(3.14)*8.40)
            }) { (_) in
                self.checkBool = false
            }
            
            
            if fish1CheckBool == false, choiceFish == "Fish1" {
                self.score += 1
                self.scoreLabel.text = "\(score)"
                self.fish1CheckBool = true
                    UIView.animate(withDuration: 0.8, animations: {
                        self.fish1.alpha = 1
                        self.fish1.center.x = self.fish1.center.x - 130
                        self.fish1.center.y = self.fish1.center.y - 130
                        self.fish1.transform = self.fish1.transform.rotated(by: CGFloat(3.14))
                        self.fish1.alpha = 0
                    }) { (_) in
                        self.fish1.transform = self.fish1.transform.rotated(by: CGFloat(-3.14))
                        self.fish1.center.x = self.fish1.center.x + 130
                        self.fish1.center.y = self.fish1.center.y + 130
                    }
                self.fish1CheckBool = false
            }
            
            
            if fish2CheckBool == false, choiceFish == "Fish2"  {
                self.score += 1
                self.scoreLabel.text = "\(score)"
                self.fish2CheckBool = true
                    UIView.animate(withDuration: 0.5, animations: {
                        self.fish2.alpha = 1
                        self.fish2.center.x = self.fish2.center.x + 130
                        self.fish2.center.y = self.fish2.center.y - 130
                        self.fish2.transform = self.fish2.transform.rotated(by: CGFloat(-3.14))
                        self.fish2.alpha = 0
                    }) { (_) in
                        self.fish2.transform = self.fish2.transform.rotated(by: CGFloat(3.14))
                        self.fish2.center.x = self.fish2.center.x - 130
                        self.fish2.center.y = self.fish2.center.y + 130
                    }
                self.fish2CheckBool = false
            }
            
            
            if fish3CheckBool == false, choiceFish == "Fish3" {
                self.score += 1
                self.scoreLabel.text = "\(score)"
                self.fish3CheckBool = true
                    UIView.animate(withDuration: 0.7, animations: {
                        self.fish3.alpha = 1
                        self.fish3.center.x = self.fish3.center.x + 40
                        self.fish3.center.y = self.fish3.center.y - 250
                        self.fish3.transform = self.fish3.transform.rotated(by: CGFloat(-3.14))
                        self.fish3.alpha = 0
                    }) { (_) in
                        self.fish3.transform = self.fish3.transform.rotated(by: CGFloat(3.14))
                        self.fish3.center.x = self.fish3.center.x - 40
                        self.fish3.center.y = self.fish3.center.y + 250
                    }
                self.fish3CheckBool = false
            }
            
            
            if fish4CheckBool == false, choiceFish == "Fish4" {
                self.score += 1
                self.scoreLabel.text = "\(score)"
                self.fish4CheckBool = true
                    UIView.animate(withDuration: 0.7, animations: {
                        self.fish4.alpha = 1
                        self.fish4.center.x = self.fish4.center.x - 70
                        self.fish4.center.y = self.fish4.center.y - 250
                        self.fish4.transform = self.fish4.transform.rotated(by: CGFloat(-3.14))
                        self.fish4.alpha = 0
                    }) { (_) in
                        self.fish4.transform = self.fish4.transform.rotated(by: CGFloat(3.14))
                        self.fish4.center.x = self.fish4.center.x + 70
                        self.fish4.center.y = self.fish4.center.y + 250
                    }
                self.fish4CheckBool = false
            }
            
            
            if trashCheckBool == false, choiceFish == "Trash" {
                self.score -= 2
                self.scoreLabel.text = "\(score)"
                self.trashCheckBool = true
                    UIView.animate(withDuration: 0.7, animations: {
                        self.trash.alpha = 1
                        self.trash.center.x = self.trash.center.x - 70
                        self.trash.center.y = self.trash.center.y - 250
                        self.trash.transform = self.trash.transform.rotated(by: CGFloat(-3.14))
                        self.trash.alpha = 0
                    }) { (_) in
                        self.trash.transform = self.trash.transform.rotated(by: CGFloat(3.14))
                        self.trash.center.x = self.trash.center.x + 70
                        self.trash.center.y = self.trash.center.y + 250
                    }
                self.trashCheckBool = false
            }
            
            
            
        }
    }
    
    @objc func timeLimit() {
        if time > 0 {
            time -= 1
            timeLabel.text = "\(time)"
            print(time)
            if time == 0 {
//                vibrate()
                print("끝")
                secretButton.isEnabled = false
                vibrate()
                timeLimitStop()
                UIView.animate(withDuration: 1) {
                    self.reStartButton.alpha = 1
                }
            }
        }else {
            timeLimitStop()
        }
    }
    
    @objc func didTapGameStartButton() {
        secretButton.isEnabled = true
        UIView.animate(withDuration: 1) {
            self.gameStartButton.alpha = 0
        }
        
        timeLimitStart()
    }
    
    @objc func didTapReStartButton() {
        secretButton.isEnabled = true
        UIView.animate(withDuration: 1) {
            self.time = 30
            self.score = 0
            self.reStartButton.alpha = 0
        }
        timeLimit()
        timeLimitStart()
    }
}

