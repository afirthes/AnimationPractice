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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(blockTapped))
        block.addGestureRecognizer(tap)
        block.isUserInteractionEnabled = true
        
    }

    @objc func blockTapped() {
        UIView.animate(withDuration: 1.2) {
            let sizeMultiplier: CGFloat = 1.5
            let currentBlockFrame = self.block.frame
            
            let newWidth = self.block.frame.width * sizeMultiplier
            let newHeght = self.block.frame.height * sizeMultiplier
            
            let newX = self.block.frame.origin.x - (newWidth - self.block.frame.size.width) / 2
            let newY = self.block.frame.origin.y - (newHeght - self.block.frame.size.height) / 2
            
            self.block.frame = CGRect(x: newX, y: newY, width: newWidth, height: newHeght)
            
        }
    }
}

