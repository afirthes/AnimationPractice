//
//  ViewController.swift
//  AnimationPractice
//
//  Created by Afir Thes on 21.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var block: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.upMove()
        
    }
    
    func upMove() {
       
        UIView.animate(withDuration: 2, delay: 2, options: .curveEaseIn) {
            self.block.frame.origin = CGPoint(x: self.view.center.x - (self.block.frame.width / 2), y: 0)
        } completion: { (success) in
            self.rightMove()
        }
    }
    
    func rightMove() {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut) {
            self.block.frame.origin = CGPoint(x: self.view.frame.size.width - self.block.frame.width, y: self.view.center.y - (self.block.frame.size.height / 2))
        } completion: { (success) in
            self.downMove()
        }
    }
    
    func downMove() {
        UIView.animate(withDuration: 2, delay: 0, options: .curveLinear) {
            self.block.frame.origin = CGPoint(x: self.view.center.x - (self.block.frame.width / 2), y: self.view.frame.height - self.block.frame.size.height)
        } completion: { (success) in
            self.leftMove()
        }
    }
    
    func leftMove() {
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut) {
            self.block.frame.origin = CGPoint(x: 0, y: self.view.center.y - (self.block.frame.size.height / 2))
        } completion: { (success) in
            self.resetMove()
        }
    }
    
    func resetMove() {
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseOut) {
            self.block.center = self.view.center
        } completion: { (success) in
            print("done")
        }
       
    }


}

