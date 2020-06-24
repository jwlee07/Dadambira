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
    let url2 = Bundle.main.url(forResource: "BOOM", withExtension: "mp3")!
    
    var timer = Timer()
    
    var time = Int()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var image: UIImage = {
        let image = UIImage(named: "BombImage")
        return image!
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
    
    private func playTheSong2() {
        do {
            soundEffect = try AVAudioPlayer(contentsOf: url2)
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
            
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.2, animations: {
                self.imageView.center.y = self.imageView.center.y - 10
                self.imageView.transform = CGAffineTransform(scaleX: 1.9, y: 1.9)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.2, animations: {
                self.imageView.center.y = self.imageView.center.y + 10
                self.imageView.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.2, animations: {
                self.imageView.center.y = self.imageView.center.y - 10
                self.imageView.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.2, animations: {
                self.imageView.center.y = self.imageView.center.y + 10
                self.imageView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.2, animations: {
                self.imageView.center.y = self.imageView.center.y - 10
                self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.2, animations: {
                self.imageView.center.y = self.imageView.center.y + 10
                self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            
            
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
    
    private func changeBackgroundColor() {
        UIView.animateKeyframes(withDuration: 0.7, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2, animations: {
                self.view.backgroundColor = .red
            })
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2, animations: {
                self.view.backgroundColor = .black
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
        
        view.backgroundColor = UIColor(rgb: 0x484c7f)
        
        view.addSubview(choiceTime)
        choiceTime.translatesAutoresizingMaskIntoConstraints = false
        choiceTime.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        choiceTime.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        imageView.image = image
        view.addSubview(imageView)
        imageView.alpha = 0
        imageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 190).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -5).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        
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
        
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = .black

        }
        
        UIView.animate(withDuration: 0.5) {
            self.choiceTime.alpha = 0
        }
        UIView.animate(withDuration: 2) {
            self.imageView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 4.3, y: 4.3)
        }
        UIView.animate(withDuration: 1.4) {
            self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
        
        
        UIView.animate(withDuration: 0.3) {
//            self.gameStratButton.center.y += 330
            self.gameStratButton.center.x += 330
        }
        
        self.time = Int(self.choiceTime.text!)!
        print(self.time)
        timeLimitStart()
    }
    
    /// 재시작 버튼 @objc
    @objc func didTapReStartButton() {
        if pickerTimeView.checkBool == true {
            gameStratButton.isEnabled = true
            UIView.animate(withDuration: 0.5) {
                self.view.backgroundColor = UIColor(rgb: 0x484c7f)
            }
            
            UIView.animate(withDuration: 1) {
                self.reStratButton.alpha = 0
            }
            
            
            UIView.animate(withDuration: 2, animations: {
//                self.gameStratButton.center.y += 330
                self.gameStratButton.center.x -= 330
            }) { (_) in
                self.choiceTime.alpha = 1
                self.gameStratButton.alpha = 1
//                self.gameStratButton.center.y -= 660
                
            }
            
            
            
            
            UIView.animate(withDuration: 1) {
                self.choiceTime.alpha = 0
            }
            
            UIView.animate(withDuration: 0.5) {

            }
            
            print(pickerTimeView.checkBool)
            pickerTimeView.didTapButton()
        }
    }
    
  
    
    
    /// 타이머 시작
    @objc func timeLimit() {
        shakeAnimation()
        if time > 0 {
            myLabel.text = String(time)
            time -= 1
            changeBackgroundColor()
            print(time)
            
            
            
            if time % 10 == 0 {
                UIView.animateKeyframes(withDuration: 0.3, delay: 0, animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4, animations: {
                        self.imageView.transform = self.imageView.transform.rotated(by: CGFloat(M_PI_2))
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                        self.imageView.transform = self.imageView.transform.rotated(by: CGFloat(M_PI_2))
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                        self.imageView.transform = self.imageView.transform.rotated(by: CGFloat(M_PI_2))
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.6, animations: {
                        self.imageView.transform = self.imageView.transform.rotated(by: CGFloat(M_PI_2))
                    })
                })
            }
            
            if time == 0 {
                vibrate()
                /// 제한 시간 도달시 시작 버튼 alpha = 0   후에   재시작 버튼 alpha = 1
                UIView.animateKeyframes(withDuration: 2, delay: 0, animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                        self.gameStratButton.alpha = 0
                    })
                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4, animations: {
                        self.reStratButton.alpha = 1
                    })
                })
                print("끝")
                
                
                soundEffect?.stop()
                playTheSong2()
                timeLimitStop()
                UIView.animate(withDuration: 1.5) {
                    self.imageView.alpha = 1
                    self.imageView.center.y = self.imageView.center.y - 200
                    UIView.animate(withDuration: 1) {
                        self.imageView.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
                    }
                    UIView.animate(withDuration: 1) {
                        self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                    }
                    
                    
                }
                let alert = UIAlertController(title: "ㅋㅋㅋ", message: "한번 더?", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "ㄴㄴ", style: .cancel, handler: nil)
                let ok = UIAlertAction(title: "ㅇㅇ", style: .default) { (_) in
                    self.didTapReStartButton()
                    UIView.animate(withDuration: 0.5) {
                        self.imageView.alpha = 0
                        self.reStratButton.alpha = 0
                        self.imageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
                        self.imageView.center.y = self.imageView.center.y + 200
                    }
                }
                present(alert, animated: true)
                alert.addAction(ok)
                alert.addAction(cancel)
            }
        }else {
            timeLimitStop()
        }
    }
}

// MARK: Extension
/// 16진수 사용을 위한 Extension
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
