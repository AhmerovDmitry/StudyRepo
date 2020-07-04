//
//  Extension + ViewController.swift
//  HW9
//
//  Created by Дмитрий Ахмеров on 14.06.2020.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import Spring

extension ViewController {
    
    func randomAnimation() {
        var animationName = ""
        var nextAnimationName = ""
        
        let animations = [
            "shake", "pop",
            "morph", "squeeze",
            "wobble", "swing",
            "flipX", "flipY",
            "fall", "squeezeLeft",
            "squeezeRight", "squeezeDown",
            "squeezeUp", "slideLeft",
            "slideRight", "slideDown",
            "slideUp", "fadeIn",
            "fadeOut", "fadeInLeft",
            "fadeInRight", "fadeInDown",
            "fadeInUp", "zoomIn",
            "zoomOut", "flash"
        ]
        //let indexForAnimation = Int.random(in: 0...animations.count - 1)

        //animationName = animations[indexForAnimation]
        //nextAnimationName = animations[indexForAnimation]
        
        if index > animations.count - 1 {
            index = 0
            animationName = animations[index]
            nextAnimationName = animations[index]
        } else {
            animationName = animations[index]
            nextAnimationName = animations[index + 1]
            print(index)
        }
        
        nameForAnimation.text = "Animation: \(animationName)"
        runButtonOutlet.setTitle(nextAnimationName, for: .normal)
        animationView.animation = animationName
        animationView.animate()
        
        index += 1
    }
    
}
