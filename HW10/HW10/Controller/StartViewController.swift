//
//  StartViewController.swift
//  HW10
//
//  Created by Дмитрий Ахмеров on 12.07.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - @IBOutlet & @IBAction
    @IBOutlet weak var starshipView: UIImageView!
    @IBOutlet weak var startButtonOutlet: UIButton!

    @IBAction func startButton(_ sender: UIButton) {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseIn, animations: {
            //self.starshipView.frame.origin.y += 250
            self.starshipView.frame.origin.y = self.startButtonOutlet.frame.origin.y
            self.starshipView.frame.size.height -= 127
        }, completion: { finished in
            self.performSegue(withIdentifier: "MainVC", sender: self)
        })
        rotate360Degrees()
    }
    // MARK: - Rotate method
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(.pi * 4.0)
        rotateAnimation.duration = duration

        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.startButtonOutlet.layer.add(rotateAnimation, forKey: nil)
    }
}
