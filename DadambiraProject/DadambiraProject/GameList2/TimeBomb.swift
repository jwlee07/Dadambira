//
//  TimeBombViewController.swift
//  DadambiraProject
//
//  Created by 김동현 on 2020/06/22.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices
import AVFoundation

var soundEffect: AVAudioPlayer?

class TimeBombViewController: UIViewController {
    // MARK: Properties
    
    let url = Bundle.main.url(forResource: "파돌리기송", withExtension: "mp3")!
    
    var booool = false
    
    var timer = Timer()
    
    var time = Int()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var image: UIImage = {
        let image = UIImage()
        return image
    }()
    
    var myLabel: UILabel = {
        let myLabel = UILabel()
        myLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        return myLabel
    }()
    
    var choiceTime: UILabel = {
        var choiceTime = UILabel()
        choiceTime.text = "3"
        choiceTime.textColor = .white
        choiceTime.font = UIFont.boldSystemFont(ofSize: 100)
        return choiceTime
    }()
    
    private var pickerTimeView: PickerTimeView = {
        let pickerTimeView = PickerTimeView()
        return pickerTimeView
    }()
    
    private var gameStratButton: UIButton = {
        let gameStratButton = UIButton()
        gameStratButton.setTitle("레쓰 기릿", for: .normal)
        gameStratButton.setTitleColor(UIColor.white, for: .normal)
        gameStratButton.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        return gameStratButton
    }()
    
    private var reStratButton: UIButton = {
        let gameStratButton = UIButton()
        gameStratButton.setTitle("한번 더ㅎㅎ", for: .normal)
        gameStratButton.setTitleColor(UIColor.white, for: .normal)
        gameStratButton.addTarget(self, action: #selector(didTapReStartButton), for: .touchUpInside)
        return gameStratButton
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureViewComponents()
    }
    
    // MARK: Helpers
    private func playTheSong() {
        do {
            soundEffect = try AVAudioPlayer(contentsOf: url)
            guard let sound = soundEffect else { return }
            sound.prepareToPlay()
            sound.play()
        }catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    
    private func timeLimitStart() {
        // 타이머 생성 . interval = 시간 간격,
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeLimit), userInfo: nil, repeats: true)
    }
    
    private func timeLimitStop() {
        timer.invalidate()
    }
    
    private func shakeAnimation() {
        UIView.animateKeyframes(withDuration: 0.25, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                self.gameStratButton.center.y -= 8
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.3, animations: {
                self.gameStratButton.center.y += 16
            })
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.3, animations: {
                self.gameStratButton.center.y -= 16
            })
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.2, animations: {
                self.gameStratButton.center.y += 8
            })
        })
    }
    
    private func vibrate() {
        // 핸드폰 설정에서 진동을 꺼둔 상황엔 동작하지 않음.
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        // 진동이 울리고 나서 할께 있으면 컴플리션에 넣어준다.
    }
    
    // MARK: Configure
    private func configure() {
        timeLimitStart()
        view.insetsLayoutMarginsFromSafeArea = false
    }
    
    // MARK: Configure View Components
    private func configureViewComponents() {
        view.addSubview(myLabel)
        
//        view.backgroundColor = UIColor(rgb: 0x484c7f)
        
        view.addSubview(choiceTime)
        choiceTime.translatesAutoresizingMaskIntoConstraints = false
        choiceTime.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        choiceTime.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        imageView.image = image
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        view.addSubview(gameStratButton)
        gameStratButton.translatesAutoresizingMaskIntoConstraints = false
        gameStratButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        gameStratButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(reStratButton)
        reStratButton.alpha = 0
        reStratButton.translatesAutoresizingMaskIntoConstraints = false
        reStratButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        reStratButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(pickerTimeView)
        pickerTimeView.translatesAutoresizingMaskIntoConstraints = false
        pickerTimeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        pickerTimeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        pickerTimeView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        pickerTimeView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    // MARK: @Objc
    @objc func didTapStartButton() {
        playTheSong()
        gameStratButton.isEnabled = false
        UIView.animate(withDuration: 1) {
            self.gameStratButton.center.y += 330
        }
        UIView.animate(withDuration: 1) {
            self.choiceTime.alpha = 0
        }
        self.time = Int(self.choiceTime.text!)!
        print(self.time)
        timeLimitStart()
    }
    
    @objc func didTapReStartButton() {
        if pickerTimeView.checkBool == true {
            pickerTimeView.didTapButton()
            pickerTimeView.checkBool = false
        }
    }
    
    //// 타이머 시작
    @objc func timeLimit() {
        shakeAnimation()
        if time > 0 {
            myLabel.text = String(time)
            time -= 1
            print(time)
            if time == 0 {
                vibrate()
                UIView.animateKeyframes(withDuration: 2, delay: 0, animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                        self.gameStratButton.alpha = 0
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4, animations: {
                        self.reStratButton.alpha = 1
                    })
                })
                print("끝")
            }
        }else {
            timeLimitStop()
        }
    }
}

// MARK: Extension
extension UIView {
    var parentViewController: UIViewController? {
        var responder: UIResponder? = self
        while let nextResponder = responder?.next {
            responder = nextResponder
            if let vc = nextResponder as? UIViewController {
                return vc
            }
        }
        return nil
    }
}
