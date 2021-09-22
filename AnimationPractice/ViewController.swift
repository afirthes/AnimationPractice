//
//  ViewController.swift
//  AnimationPractice
//
//  Created by Afir Thes on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var block: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    var animator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAnimation()
    }
    
    func setupAnimation() {
        
        self.block.transform = CGAffineTransform.identity
        self.block.frame.origin.x = CGFloat(0)
        self.block.backgroundColor = UIColor.black
        
        animator = UIViewPropertyAnimator(duration: 1.2, curve: UIView.AnimationCurve.linear, animations: {
            let screenWidth = self.view.frame.width
            let blockWidth = self.block.frame.width
            
            self.block.frame.origin.x = screenWidth - blockWidth
            self.block.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        })
        
        animator.addCompletion { (position) in
            
            self.block.backgroundColor = UIColor.red
            
        }
        
    }
    
    @IBAction func startAction(_ sender: Any) {
        
        if animator.isRunning {
            // still in flight
            return
        }
        
        switch animator.state{
            case .active:
                animator.isReversed = true
                
                animator.addAnimations {
                    self.block.transform = CGAffineTransform.init(scaleX: 1.7, y: 1.7)
                }
                animator.startAnimation()
            case .inactive:
                setupAnimation()
                animator.startAnimation()
                break
            case .stopped:
                animator.finishAnimation(at: .end)
            @unknown default:
                break
        }
    }
    
    @IBAction func pauseAction(_ sender: Any) {
        if animator.state == UIViewAnimatingState.active {
            animator.pauseAnimation()
        }
    }
    
    @IBAction func stopAction(_ sender: Any) {
        animator.stopAnimation(false)
    }
    
    @IBAction func sliderDidChange(_ sender: Any) {
        animator.fractionComplete = CGFloat(slider.value)
    }
}

