//
//  ViewController.swift
//  HW 1
//
//  Created by Дмитрий Ахмеров on 5/12/20.
//  Copyright © 2020 Дмитрий Ахмеров. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var viewArray: [UIView]!
    @IBOutlet weak var textOnButton: UIButton!
    var touchCount = 0
    
    // change alpha and cornerRadius for "viewArray"
    func settings(for arrayView: [UIView], alpha: CGFloat, cornerRadius: CGFloat) {
        for view in arrayView {
            view.alpha = alpha
            view.layer.cornerRadius = cornerRadius
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settings(for: viewArray, alpha: 0.3, cornerRadius: 75)
        // change color for "view"
        viewArray[0].backgroundColor = .red
        viewArray[1].backgroundColor = .orange
        viewArray[2].backgroundColor = .green
        //
        textOnButton.layer.cornerRadius = 15
    }
    
    @IBAction func button() {
        touchCount += 1
        if touchCount == 1 || touchCount % 3 == 1 {
            viewArray[0].alpha = 1
            viewArray[1].alpha = 0.3
            viewArray[2].alpha = 0.3
        } else if touchCount == 2 || touchCount % 3 == 2 {
            viewArray[0].alpha = 0.3
            viewArray[1].alpha = 1
            viewArray[2].alpha = 0.3
        } else if touchCount % 3 == 0 {
            viewArray[0].alpha = 0.3
            viewArray[1].alpha = 0.3
            viewArray[2].alpha = 1
        }
        textOnButton.setTitle("NEXT", for: .normal)
    }

}

