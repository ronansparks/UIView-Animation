//
//  ViewController.swift
//  UIView Animations
//
//  Created by Ronan on 4/24/18.
//  Copyright © 2018 RonanStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    let duration: TimeInterval = 2
    let delay: TimeInterval = 1
    var leftViewOriginCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        leftViewOriginCenter = leftView.center
    }

    //MARK: - 属性动画
    //普通动画，没有回调
    @IBAction func showNormalAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: duration) {
            self.leftView.center = self.rightImageView.center
        }
        self.rightImageView.image = UIImage(named: "dog")
    }
    
    //普通动画
    @IBAction func showCallbackAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: duration, animations: {
            self.leftView.center = self.rightImageView.center
        }) { finishFlag in
            print("动画完成回调 \(#function)")
        }
    }
    
    //延迟动画
    @IBAction func showDelayAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
            self.leftView.center = self.rightImageView.center
        }) { finishFlag in
            print("动画完成回调 \(#function)")
        }
    }
    
    //弹性动画
    @IBAction func showSpringAnimation(_ sender: UIButton) {
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0, initialSpringVelocity: 0, options: [], animations: {
            self.leftView.center = self.rightImageView.center
        }) { finishFlag in
            print("动画完成回调 \(#function)")
        }
    }
    
    //帧动画
    @IBAction func showKeyFrameAnimation(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: [], animations: {
            //第一个关键帧开始位置，时长为 5 x 0.1 秒
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
                self.leftView.backgroundColor = .red
            })
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.3, animations: {
                self.leftView.backgroundColor = .green
            })
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6, animations: {
                self.leftView.backgroundColor = .blue
            })
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
                
            })
        }) { finishFlag in
            print("动画完成回调 \(#function)")
        }
    }
    
    //MARK: - 转场动画
    //从左翻转
    @IBAction func flipFromLeft(_ sender: UIButton) {
        UIView.transition(with: rightImageView, duration: duration, options: .transitionFlipFromLeft, animations: {
            self.rightImageView.image = UIImage(named: "dog")
        }) { isFinished in
            print("动画完成回调 \(#function)")
        }
    }
    
    //从上翻转
    @IBAction func flipFromTop(_ sender: UIButton) {
        UIView.transition(with: rightImageView, duration: duration, options: .transitionFlipFromTop, animations: {
            self.rightImageView.image = UIImage(named: "dog")
        }) { isFinished in
            print("动画完成回调 \(#function)")
        }
    }
    
    //从上卷曲翻页
    @IBAction func curlDown(_ sender: UIButton) {
        UIView.transition(with: rightImageView, duration: duration, options: .transitionCurlDown, animations: {
            self.rightImageView.image = UIImage(named: "dog")
        }) { isFinished in
            print("动画完成回调 \(#function)")
        }
    }
    
    //溶解过渡
    @IBAction func crossDissolve(_ sender: UIButton) {
        UIView.transition(with: rightImageView, duration: duration, options: .transitionCrossDissolve, animations: {
            self.rightImageView.image = UIImage(named: "dog")
        }) { isFinished in
            print("动画完成回调 \(#function)")
        }
    }
    
    //MARK: - 重置画面
    //重置色块位置、颜色
    @IBAction func resetColorBlock(_ sender: UIButton) {
        leftView.center = leftViewOriginCenter
        leftView.backgroundColor = .black
    }
    
    //重置图片
    @IBAction func resetImageView(_ sender: UIButton) {
        rightImageView.image = UIImage(named: "cat")
    }
}

